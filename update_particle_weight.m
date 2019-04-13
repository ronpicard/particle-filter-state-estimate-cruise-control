function [particles, new_weight] = update_particle_weight(nbr_of_states,predicted_velocity,measured_v,particles,particle_index,velocity_sigma)
    
    % for each state
    for state = 1:nbr_of_states
        % calculate the likelihood of measured value
        new_weight = abs(measured_v-predicted_velocity);

%        new_weight = abs(measured_v-predicted_velocity)/velocity_sigma;

%         diff = measured_v - predicted_velocity;
%         if(diff > 0)
%             upper = normcdf(measured_v,predicted_velocity,velocity_sigma);
%             lower = normcdf(measured_v-2*diff,predicted_velocity,velocity_sigma);
%             new_weight = 1 - (upper-lower);
%         elseif(diff < 0)
%             upper = normcdf(measured_v+2*diff,predicted_velocity,velocity_sigma);
%             lower = normcdf(measured_v,predicted_velocity,velocity_sigma);
%             new_weight = 1 - (upper-lower);
%         else
%             new_weight = 1;
%         end
        % update weight
        particles(state, particle_index, 2) = new_weight;
    end
end

