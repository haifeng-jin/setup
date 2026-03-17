import torch

print(f"PyTorch Version: {torch.__version__}")
print(f"CUDA Available: {torch.cuda.is_available()}")

if torch.cuda.is_available():
    print(f"CUDA Device Count: {torch.cuda.device_count()}")
    print(f"CUDA Device Name: {torch.cuda.get_device_name(0)}")
    
    # Simple tensor operation on GPU
    x = torch.tensor([1.0, 2.0, 3.0], device='cuda')
    y = torch.tensor([4.0, 5.0, 6.0], device='cuda')
    z = x + y
    
    print(f"Tensor on GPU: {z}")
    print("CUDA is successfully set up and working with PyTorch!")
else:
    print("CUDA is not available. Setup failed.")
