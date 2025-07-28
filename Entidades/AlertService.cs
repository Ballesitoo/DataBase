using Radzen;

namespace DataBase.Entidades
{
    public class AlertService
    {
        private readonly DialogService _dialogService;

        public AlertService(DialogService dialogService)
        {
            _dialogService = dialogService;
        }

        public async Task ShowAlert(string message, string title)
        {
            await _dialogService.Alert(message, title, new AlertOptions()
            {
                OkButtonText = "Continuar",
                Width = "700px",
                Left = "calc(50% - 430px)",
                Top = "calc(50% - 200px)"
            });
        }

        public async Task<bool> ShowConfirmation(string message, string title)
        {
            var result = await _dialogService.Confirm(
                message,
                title,                
                new ConfirmOptions
                {
                    OkButtonText = "Si",
                    CancelButtonText = "No",
                    Width = "700px",
                    Left = "calc(50% - 430px)",
                    Top = "calc(50% - 200px)"
                });

            return result.HasValue && result.Value; // Torna true si l'usuari confirma, false si cancela
        }
    }
}
