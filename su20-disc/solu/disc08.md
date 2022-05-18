# 1

1.1	~~false~~ True. Recall that latency is the time for one instruction to nish, while throughput is the number of instructions processed per unit time. Pipelining results in a higher throughput because more instructions are run at once. At the same time, latency is also higher as each individual instruction may take longer from start to nish  because each cycle must last as long as the longest cycle. Additionally, hazards may
be introduced.

1.2	true

1.3	false

1.4	branch prediction table

One way is stalling until the result of the branch instruction is determined. Another is to predict which path the branch will take and if incorrect flush the pipeline.

# 2

2.1	reduce the cycle time, improve the frequency

When we pipeline the datapath, the values from each stage need to be passed on at each clock cycle. Each stage in the pipeline only operates on a small set of values, but those values need to be correct with respect to the instruction that is currently being processed. Say we use load word (lw) as an example: if it is in the EX stage, then the EX stage should look like a snapshot of the single-cycle datapath. The values on the rs1, rs2, immediate, and PC values should be as if lw was the only
instruction in the entire path. This also includes the control logic: the instruction is passed in at each stage, the appropriate control signals are generated for the stage of interest, and that stage can execute properly.

2.2	avoid more registers

We add +4 to the PC again in the memory stage so we don't need to pass both PC and PC+4 along the whole pipeline.

2.3	store message for later instructions

We need to save the instruction in a register multiple times because each pipeline stage needs to receive the right control signals for the instruction currently in that stage.

# 3

3.1	55ps

3.2	30+20+150+20+30+75+200+20+30+200+20+30+25=850ps

3.3	i don't know

# 4

4.1	EX end to next ID end

4.2	2

4.3	stall one stage

4.4	2314

4.5	jump first, modify later

![image-20220518102616382](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220518102616382.png)

4.6	1,2 data hazard	2,3 data hazard	4 control hazard

​		 1,4 2,5 structual hazard

​		 0	2

![image-20220518103032790](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220518103032790.png)