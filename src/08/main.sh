#Visit Grafana Labs' official website for the "Node Exporter Quickstart and Dashboard": https://grafana.com/grafana/dashboards/13978

#Install iperf3 on both virtual machines:
sudo apt update
sudo apt install iperf3

#On VM1, run iperf3 in server mode:
iperf3 -s

#On VM2, run iperf3 in client mode, connecting to the IP address of VM1:
iperf3 -c <VM1_IP_ADDRESS>


