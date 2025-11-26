from fastapi import FastAPI 
from typing import List
from app.models import todoItem
from datetime import datetime

app = FastAPI()
todos: List[todoItem] = []
@app.get ("/todos", response_model=List[todoItem])

def list_todo():
    return todos
@app.post ("/todos", response_model=todoItem)
def create_todo(item: todoItem):
    if any(t.id == item.id  for t in todos):
        raise HTTPException(status_code=400, detail="Todo item with this ID already exists.")
    todos.append(item)
    return item

@app.get ("/todos/{todo_id}", response_model=todoItem)
def get_todo(todo_id: int):
    for t in todos:
        if t.id ==todo_id:
            return t
    raise HTTPException(status_code=404, detail="Todo item not found.")

@app.put ("/todos/{todo_id}", response_model=todoItem)
def update_todo(todo_id: int,  item: todoItem):
    for idx, t in enumerate(todos):
        if t.id == todo_id:
            todos[idx] = item
            return item
    raise HTTPExcetption(status_code=404, detail= "Todo item not found.")
  
@app.delete("/todos/{todo_id}")
def delete_todo(todo_id: int):
    for idx, t in enumerate(todos):
        if t.id == todo_id:
            del todos[idx]
            return{"detail": "Todo item deleted"}
    raise HTTPException(status_code=404, detail="Todo item not found.") 
      # In-memory storage for todo items