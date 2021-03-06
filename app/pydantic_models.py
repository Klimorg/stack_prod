from datetime import date, datetime, time

import arrow
from pydantic import BaseModel, BaseSettings, Field


class InferenceBase(BaseModel):
    inference_date: date = Field(default=arrow.now().format("YYYY-MM-DD"))
    inference_time: time = Field(default=arrow.now().format("HH:mm:ss"))
    num_detections: int = Field(nullable=True)
    confidence: float = Field(ge=0.0, le=1.0)


class Inferences(InferenceBase):
    id: int = Field(default=None, primary_key=True)


class InferenceCreate(InferenceBase):
    class Config:
        orm_mode = True


class InferenceRead(InferenceBase):
    id: int


class DeploymentInfo(BaseModel):
    deployment_commit: str
    deployment_date: datetime
