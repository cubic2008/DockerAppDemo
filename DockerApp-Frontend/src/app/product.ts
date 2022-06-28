export class Product {
    id: number = 0
    name: string = ""
    model: string = ""
    price: number = 0.0
    quantity: number = 0
}

export const PRODUCTS : Product[] = [
    {id: 1, name: 'Laptop', model: 'Lenovo X1 Carbon', price: 3699.98, quantity: 100},
    {id: 2, name: 'Laptop', model: 'Dell Pavlion 3312', price: 2799.98, quantity: 120},
    {id: 3, name: 'USB', model: 'SanDisk Ultra 128GB', price: 69.99, quantity: 300}
]