import docker
from datetime import datetime

def get_containers_sorted_by_creation():
    # Initialize Docker client
    client = docker.from_env()
    
    # Get all containers
    containers = client.containers.list(all=True)
    
    # Extract container info
    container_info = []
    for container in containers:
        container_info.append({
            "ID": container.short_id,
            "Name": container.name,
            "Status": container.status,
            "Image": container.image.tags[0] if container.image.tags else "None",
            "Created": container.attrs['Created']
        })
    
    # Sort containers by creation time
    sorted_containers = sorted(
        container_info,
        key=lambda x: x['Created']
    )
    
    return sorted_containers

def print_container_table(containers):
    #  Print table title
    print("-" * 40)
    print("Containers Sorted by Creation Time:")
    print("-" * 40)
    print()

    # Print table header
    print("-" * 120)
    print(f"{'ID':<12} {'Name':<30} {'Status':<15} {'Image':<30} {'Created At (UTC)':<25}")
    print("-" * 120)
    
    # Print each container's details
    for container in containers:
        created_time = datetime.strptime(
            container['Created'].split('.')[0],  # Remove microseconds
            "%Y-%m-%dT%H:%M:%S"
        ).strftime("%Y-%m-%d %H:%M:%S")
        
        print(
            f"{container['ID']:<12} "
            f"{container['Name']:<30} "
            f"{container['Status']:<15} "
            f"{container['Image']:<30} "
            f"{created_time:<25}"
        )

if __name__ == "__main__":
    try:
        containers = get_containers_sorted_by_creation()
        print_container_table(containers)
    except Exception as e:
        print(f"[ERROR] {e}")

