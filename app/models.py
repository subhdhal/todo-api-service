from pydantic import BaseModel 
from typing import List, Optional
from datetime import datetime

class todoItem(BaseModel):
    id: int
    title: str
    description: Optional[str] = None
    completed: bool = False
