require 'rspec'
require_relative  '../app/array_solver'

RSpec.describe ArraySolver do
  describe "#solve_array" do
    subject { described_class.new.solve_array(input) }

    context 'when multiple solutions exist' do
      let(:input) { [36, 60, 702] }
      let(:expected_result_sum) { 36 + 60 + 702 + 210 + 30 }

      it 'has every number divisible by three' do
        subject.each do |number|
          expect(number.digits.sum % 3).to eq(0)
        end
      end

      it 'has biggest sum possible' do
        expect(subject.sum).to eq(expected_result_sum)
      end
    end

    context 'when can not change nothing' do
      let(:input) { [99, 9, 999] }
      let(:expected_result) { [99, 9, 999] }

      it 'changes nothing' do
        expect(subject).to match_array(expected_result)
      end
    end

    context 'when given three numbers divisible by 3' do

      context 'when solution does not reach over 9 in first digit' do
        let(:input) { [36, 60, 201] }
        let(:expected_result) { [36, 60, 801] }

        it 'changes biggest number only on the first digit' do
          expect(subject).to match_array(expected_result)
        end
      end

      context 'when solution reaches 9 in first digit' do
        let(:input) { [3, 6, 501] }
        let(:expected_result) { [3, 6, 921] }

        it 'does not change the order of magnitude but changes next digit' do
          expect(subject).to match_array(expected_result)
        end

        context 'when solution should switch to another number then' do
          let(:input) { [36, 612, 621] }
          let(:expected_result) { [36, 912, 921] }

          it 'reaches 9 in the biggest number and switches to more profitable number in case of iteration change' do
            expect(subject).to match_array(expected_result)
          end
        end
      end
    end

    context 'when some numbers are not divisible by 3' do

      context 'when solution reaches 9 in first digit' do
        let(:input) { [3, 5, 701] }
        let(:expected_result) { [3, 6, 921] }

        it 'does not change the order of magnitude but changes next digit' do
          expect(subject).to match_array(expected_result)
        end
      end

      context 'when 3 changes are needed to achieve divisibility' do
        let(:input) { [32, 40, 501] }
        let(:expected_result) { [42, 60, 801] }

        it 'grants divisibility first and then uses all moves to make biggest sum possible' do
          expect(subject).to match_array(expected_result)
        end
      end

      context 'when less than 3 changes are needed to achieve divisibility' do
        let(:input) { [36, 40, 501] }
        let(:expected_result) { [36, 60, 801] }

        it 'does not use all steps in order to maintain divisibility' do
          expect(subject).to match_array(expected_result)
        end
      end
    end
  end
end
