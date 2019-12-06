Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B6114C4E
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 07:16:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tj5N3fQQzDqby
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 17:16:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tj4Q19nJzDqbq
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 17:15:16 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB66CnBl108774
 for <openbmc@lists.ozlabs.org>; Fri, 6 Dec 2019 01:15:13 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq2xcrts5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 06 Dec 2019 01:15:13 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 6 Dec 2019 06:15:11 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 06:15:08 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB66F7OV45154450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 06:15:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB754C078;
 Fri,  6 Dec 2019 06:15:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 760044C044;
 Fri,  6 Dec 2019 06:15:06 +0000 (GMT)
Received: from [9.122.210.145] (unknown [9.122.210.145])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 06:15:06 +0000 (GMT)
Subject: Re: Adding new metric definition use case
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Neeraj Ladkani <neladk@microsoft.com>
References: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
 <BY5PR21MB1377E4996FF4D8AB139BA5D2C8420@BY5PR21MB1377.namprd21.prod.outlook.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A3109D0D@IRSMSX101.ger.corp.intel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A310A5EB@IRSMSX101.ger.corp.intel.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 6 Dec 2019 11:45:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A310A5EB@IRSMSX101.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19120606-0016-0000-0000-000002D1FCB4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120606-0017-0000-0000-000033340500
Message-Id: <197d6f2d-bcae-a8f0-201e-f7302dd5df9b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_01:2019-12-04,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060054
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

hello Piotr,

Could we use the mailing list for those discussions ?

!! Vishwa !!

On 12/5/19 8:39 PM, Matuszczak, Piotr wrote:
> Hi Neeraj,
>
> I've analyzed your use case with Adrian. It looks like you want to define new, synthesized metric from existing D-Bus sensors. We would like to propose a design to implement user-defined metrics, which are synthesized from other metrics using mathematical formulas defined by the user. Such formula may be provided by the user in runtime, not requiring recompilation of OpenBMC. We can discuss  it during the next Telemetry WG meeting.
>
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+piotr.matuszczak=intel.com@lists.ozlabs.org> On Behalf Of Matuszczak, Piotr
> Sent: Tuesday, December 3, 2019 4:42 PM
> To: Neeraj Ladkani <neladk@microsoft.com>
> Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel.com>
> Subject: RE: Adding new metric definition use case
>
> Hi Neeraj,
>
> There are two cases:
> 1. Sensor is already monitored and you want to define new Metric Definition. It is done on the Redfish level. Also in the case when you want to create calculated metric ("Implementation" property equals "Calculated"). In this case min/max/average can be calculated (as defined by the "CalculationAlgorithm" property).
> 2. You want to create Metric Definition for Synthesized sensor ("Implementation" property equals "Synthesized"). This is the example you shown below. In such case, there is no way to provide BMC the algorithm how the metric shall be synthesized from source metrics. In this case, the calculation algorithm has to be implemented as virtual sensor in the BMC prior to defining the Metric Definition. If you want to be able to create synthesized sensors in runtime, additional design will have to be provided.
>
> Regards
> Piotr
>
> -----Original Message-----
> From: Neeraj Ladkani <neladk@microsoft.com>
> Sent: Tuesday, December 3, 2019 8:40 AM
> To: Matuszczak, Piotr <piotr.matuszczak@intel.com>
> Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel.com>
> Subject: RE: Adding new metric definition use case
>
> Hi Piotr,
>
> The use case is simple that if we want to add new metric definition which is already monitored on DBUS and exposed on redfish , we should be able to configure it without changing BMC code.
>
> For example:
> {
>      "@odata.type": "#MetricDefinition.v1_0_3.MetricDefinition",
>      "Id": "OutletAirflowTemp",
>      "Name": "Definition of Outlet Airflow Temperature",
>      "MetricType": "Numeric",
>      "Implementation": "Synthesized",
>      "PhysicalContext": "Exhaust",
>      "Units": "Cel",
>      "Wildcards": [
>          {
>              "Name": "ChassisID",
>              "Values": [
>                  "1"
>              ]
>          }
>      ],
>      "CalculationParameters": [
>          {
>              "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Temperatures/2/ReadingCelsius"
>          },
>          {
>              "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Fans/0/Reading"
>          },
>          {
>              "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Thermal#/Fans/1/Reading"
>          },
>          {
>              "SourceMetric": "/redfish/v1/Chassis/{ChassisID}/Power#/PowerControl/0/PowerConsumedWatts",
>              "ResultMetric": "/redfish/v1/Chassis/{ChassisID}/Power#/PowerControl/0/PowerMetrics/AverageConsumedWatts"
>          }
>      ],
>      "@odata.id": "/redfish/v1/TelemetryService/MetricDefinitions/OutletAirflowTemp",
>      "@Redfish.Copyright": "Copyright 2014-2019 DMTF. For the full DMTF copyright policy, see http://www.dmtf.org/about/policies/copyright."
> }
>
> -----Original Message-----
> From: Matuszczak, Piotr <piotr.matuszczak@intel.com>
> Sent: Thursday, November 28, 2019 3:33 AM
> To: Neeraj Ladkani <neladk@microsoft.com>
> Cc: openbmc@lists.ozlabs.org; Ambrozewicz, Adrian <adrian.ambrozewicz@intel.com>
> Subject: [EXTERNAL] Adding new metric definition use case
>
> Hi Neeraj,
>
> 	As we talked recently during the Telemetry WG meeting, you were asking about adding new metric definitions. Please, let me better understand your use case, you have HW sensor present on the board (for example, let it be CPU0 VR temperature), you have already HWmon reading it and exposing it as the sensor on D-Bus. You want to be able to add the new Metric Definition for proper interpretation of sensor's reading and new metric definition shall also modify sensor's D-Bus parameters (Scale and Unit) ? Do I understand it correctly?
> 	Monitoring Service does not have to interpret the metric from the sensors, because it is used only for report management.
> 	
>
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
>

