variable "age" {
  type = number
  default = 10
}

# output "o1" {
#   value = var.age
# }

variable "name" {
  type = string
  default = "Anu"
  
}

variable "lastName" {
  type = string
  default = "Suresh"
}

# output "o2" {
#   value = var.name
# }


variable "num1" {
  type = number
  default = 5
}

variable "num2" {
  type = number
  default = 10
}

# output "o3" {
#   value = var.num1 + var.num2
# }

# output "o4" {
#   value = "hi ${var.name}"
# }

# output "o5" {
#   value = "${var.name}   ${var.lastName}"
# }


//List

variable "mylist" {
  default = ["sg1", "sg2", "sg3", "sg4"]
}

# output "o6" {
#   value = var.mylist[0]
# }


// Map

variable "mymap1" {
  type = map 
  default = {
           "Name" = "RedhatOS"
           "Env"  = "Dev"
            "Location" = "Chennai"
  }
}

output "o7" {
  value = var.mymap1
}

# Boolean

variable "mybool" {
  type = bool 
  default = true
}

output "o8" {
  value = var.mybool
}

// Multi-Line String

variable "multiline" {           

  default = <<-EOT
              this is a first line
              this is a second line
              this is a third line
             EOT

}

output "o9" {
  value = var.multiline
}