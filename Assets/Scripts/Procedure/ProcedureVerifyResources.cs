using GameFramework.Event;
using UnityGameFramework.Runtime;
using ProcedureOwner = GameFramework.Fsm.IFsm<GameFramework.Procedure.IProcedureManager>;

namespace TheLight
{
    public class ProcedureVerifyResources : ProcedureBase
    {
        private bool m_VerifyResourcesComplete = false;

        public override bool UseNativeDialog
        {
            get
            {
                return true;
            }
        }

        protected override void OnEnter(ProcedureOwner procedureOwner)
        {
            base.OnEnter(procedureOwner);
            
            m_VerifyResourcesComplete = false;
        }

        protected override void OnLeave(ProcedureOwner procedureOwner, bool isShutdown)
        {
            base.OnLeave(procedureOwner, isShutdown);
        }

        protected override void OnUpdate(ProcedureOwner procedureOwner, float elapseSeconds, float realElapseSeconds)
        {
            base.OnUpdate(procedureOwner, elapseSeconds, realElapseSeconds);

            if (!m_VerifyResourcesComplete)
            {
                return;
            }

            ChangeState<ProcedureCheckResources>(procedureOwner);
        }

        private void OnVerifyResourcesComplete(bool result)
        {
            m_VerifyResourcesComplete = true;
            Log.Info("Verify resources complete, result is '{0}'.", result);
        }

        private void OnResourceVerifyStart(object sender, GameEventArgs e)
        {
            
        }

        private void OnResourceVerifySuccess(object sender, GameEventArgs e)
        {
        }

        private void OnResourceVerifyFailure(object sender, GameEventArgs e)
        {
        }
    }
}
