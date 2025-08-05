
contacts = {}

def add_contact():
        name = input("Enter name: ")
        if name in contacts:
            print("Contact already exists.")
        else:
            phone = input("Enter phone: ")
            contacts[name] = phone
            print("Contact added.")

def view_contacts():
        if not contacts:
            print("No contacts to show.")
        else:
            print("\nContact List:")
            for name, phone in contacts.items():
                print(f"- {name}: {phone}")

def delete_contact():
        name = input("Enter name to delete: ")
        if name in contacts:
            del contacts[name]
            print("Contact deleted.")
        else:
            print("Contact not found.")

while True:
            print("\n--- Contact Manager ---")
            print("1. Add Contact")
            print("2. View Contacts")
            print("3. Delete Contact")
            print("4. Exit")
            choice = input("Enter your choice: ")

            if choice == "1":
                add_contact()
            elif choice == "2":
                view_contacts()
            elif choice == "3":
                delete_contact()
            elif choice == "4":
                print("Exist!")
                break
            else:
                print("Invalid choice! Please try again.")





  
