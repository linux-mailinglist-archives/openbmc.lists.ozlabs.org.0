Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87F2141D
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:18:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45504z60MdzDqSR
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 17:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45504X4PTxzDqRK
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 17:18:03 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4H7HfIa080234
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 03:18:00 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2shqhd28yw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 03:17:59 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 17 May 2019 08:17:56 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 May 2019 08:17:54 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4H7HrUs50331798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 May 2019 07:17:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28E76A4057;
 Fri, 17 May 2019 07:17:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 601EDA404D;
 Fri, 17 May 2019 07:17:52 +0000 (GMT)
Received: from [9.122.210.251] (unknown [9.122.210.251])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 May 2019 07:17:52 +0000 (GMT)
Subject: Re: BMC health metrics (again!)
To: Neeraj Ladkani <neladk@microsoft.com>, Kun Yi <kunyi@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <a28747c1-a6c5-65c9-87da-d8df0ce0b14e@linux.vnet.ibm.com>
 <BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Fri, 17 May 2019 12:47:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------5B1483F5AE95B8D828285942"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051707-0028-0000-0000-0000036EA440
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051707-0029-0000-0000-0000242E41E6
Message-Id: <83b3990a-19c0-a0af-a28a-cedf8401bffb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170049
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------5B1483F5AE95B8D828285942
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Neeraj,

Thanks for the inputs. It's nice to see us having a similar thought.

AFAIK, we don't have any work-group that is driving “Platform telemetry 
and health monitoring”. Also, do we want to see this as 2 different 
entities ?. In the past, there were thoughts about using websockets to 
channel some of the thermal parameters as telemetry data. But then it 
was not implemented.

We can discuss here I think.

!! Vishwa !!

On 5/17/19 12:00 PM, Neeraj Ladkani wrote:
>
> At cloud scale, telemetry and health monitoring is very critical. We 
> should define a framework that allows platform owners to add their own 
> telemetry hooks. Telemetry service should be designed to make this 
> data accessible and store in resilient way (like blackbox during plane 
> crash).
>
> Is there any workgroup that drives this feature “Platform telemetry 
> and health monitoring” ?
>
> Wishlist
>
> BMC telemetry :
>
>  1. Linux subsystem
>      1. Uptime
>      2. CPU Load average
>      3. Memory info
>      4. Storage usage ( RW )
>      5. Dmesg
>      6. Syslog
>      7. FDs of critical processes
>      8. Alignment traps
>      9. WDT excursions
>  2. IPMI subsystem
>      1. Request and Response logging par interface with timestamps (
>         KCS, LAN, USB)
>      2. Request and Response of IPMB
>
> i.Request , Response, No of Retries
>
>  3. Misc
>
>  1. Critical Temperature Excursions
>
> i.Minimum Reading of Sensor
>
> ii.Max Reading of a sensor
>
> iii.Count of state transition
>
> iv.Retry Count
>
>  2. Count of assertions/deassertions of GPIO and ability to capture
>     the state
>  3. timestamp of last assertion/deassertion of GPIO
>
> Thanks
>
> ~Neeraj
>
> *From:*openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> 
> *On Behalf Of *vishwa
> *Sent:* Wednesday, May 8, 2019 1:11 AM
> *To:* Kun Yi <kunyi@google.com>; OpenBMC Maillist 
> <openbmc@lists.ozlabs.org>
> *Subject:* Re: BMC health metrics (again!)
>
> Hello Kun,
>
> Thanks for initiating it. I liked the /proc parsing. On the IPMI 
> thing, is it only targeted to IPMI -or- a generic BMC-Host 
> communication kink ?
>
> Some of the things in my wish-list are:
>
> 1/. Flash wear and tear detection and the threshold to be a config option
> 2/. Any SoC specific health checks ( If that is exposed )
> 3/. Mechanism to detect spurious interrupts on any HW link
> 4/. Some kind of check to see if there will be any I2C lock to a given 
> end device
> 5/. Ability to detect errors on HW links
>
> On the watchdog(8) area, I was just thinking these:
>
> How about having some kind of BMC_health D-Bus properties -or- a 
> compile time feed, whose values can be fed into a configuration file 
> than watchdog using the default /etc/watchdog.conf always. If the 
> properties are coming from a D-Bus, then we could either append to 
> /etc/watchdog.conf -or- treat those values only as the config file 
> that can be given to watchdog.
> The systemd service files to be setup accordingly.
>
>
> We have seen instances where we get an error that is indicating no 
> resources available. Those could be file descriptors / socket 
> descriptors etc. A way to plug this into watchdog as part of test 
> binary that checks for this ? We could hook a repair-binary to take 
> the action.
>
>
> Another thing that I was looking at hooking into watchdog is the test 
> to see the file system usage as defined by the policy.
> Policy could mention the file system mounts and also the threshold.
>
> For example, /tmp , /root etc.. We could again hook a repair binary to 
> do some cleanup if needed
>
> If we see the list is growing with these custom requirements, then 
> probably does not make sense to pollute the watchdog(2) but
> have these consumed into the app instead ?
>
> !! Vishwa !!
>
> On 4/9/19 9:55 PM, Kun Yi wrote:
>
>     Hello there,
>
>     This topic has been brought up several times on the mailing list
>     and offline, but in general seems we as a community didn't reach a
>     consensus on what things would be the most valuable to monitor,
>     and how to monitor them. While it seems a general purposed
>     monitoring infrastructure for OpenBMC is a hard problem, I have
>     some simple ideas that I hope can provide immediate and direct
>     benefits.
>
>     1. Monitoring host IPMI link reliability (host side)
>
>     The essentials I want are "IPMI commands sent" and "IPMI commands
>     succeeded" counts over time. More metrics like response time would
>     be helpful as well. The issue to address here: when some IPMI
>     sensor readings are flaky, it would be really helpful to tell from
>     IPMI command stats to determine whether it is a hardware issue, or
>     IPMI issue. Moreover, it would be a very useful regression test
>     metric for rolling out new BMC software.
>
>     Looking at the host IPMI side, there is some metrics exposed
>     through /proc/ipmi/0/si_stats if ipmi_si driver is used, but I
>     haven't dug into whether it contains information mapping to the
>     interrupts. Time to read the source code I guess.
>
>     Another idea would be to instrument caller libraries like the
>     interfaces in ipmitool, though I feel that approach is harder due
>     to fragmentation of IPMI libraries.
>
>     2. Read and expose core BMC performance metrics from procfs
>
>     This is straightforward: have a smallish daemon (or
>     bmc-state-manager) read,parse, and process procfs and put values
>     on D-Bus. Core metrics I'm interested in getting through this way:
>     load average, memory, disk used/available, net stats... The values
>     can then simply be exported as IPMI sensors or Redfish resource
>     properties.
>
>     A nice byproduct of this effort would be a procfs parsing library.
>     Since different platforms would probably have different monitoring
>     requirements and procfs output format has no standard, I'm
>     thinking the user would just provide a configuration file
>     containing list of (procfs path, property regex, D-Bus property
>     name), and the compile-time generated code to provide an object
>     for each property.
>
>     All of this is merely thoughts and nothing concrete. With that
>     said, it would be really great if you could provide some feedback
>     such as "I want this, but I really need that feature", or let me
>     know it's all implemented already :)
>
>     If this seems valuable, after gathering more feedback of feature
>     requirements, I'm going to turn them into design docs and upload
>     for review.
>
>     -- 
>
>     Regards,
>
>     Kun
>

--------------5B1483F5AE95B8D828285942
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Neeraj,</p>
    <p>Thanks for the inputs. It's nice to see us having a similar
      thought.</p>
    <p>AFAIK, we don't have any work-group that is driving <span
        style="color:windowtext">“Platform telemetry and health
        monitoring”. Also, do we want to see this as 2 different
        entities ?. In the past, there were thoughts about using
        websockets to channel some of the thermal parameters as
        telemetry data. But then it was not implemented.</span></p>
    <p><span style="color:windowtext">We can discuss here I think.</span></p>
    <p><span style="color:windowtext">!! Vishwa !!<br>
      </span></p>
    <div class="moz-cite-prefix">On 5/17/19 12:00 PM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:209733967;
	mso-list-type:hybrid;
	mso-list-template-ids:370437354 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:629939391;
	mso-list-type:hybrid;
	mso-list-template-ids:1528842280 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:680204859;
	mso-list-type:hybrid;
	mso-list-template-ids:-205626744 67698713 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.0in;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.5in;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:2.0in;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.5in;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.0in;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.5in;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.0in;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.5in;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:5.0in;
	text-indent:-9.0pt;}
@list l3
	{mso-list-id:1127358141;
	mso-list-type:hybrid;
	mso-list-template-ids:293792440 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l3:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l3:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l3:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4
	{mso-list-id:1620336591;
	mso-list-type:hybrid;
	mso-list-template-ids:-1154200314 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l4:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5
	{mso-list-id:1909806149;
	mso-list-type:hybrid;
	mso-list-template-ids:375685314 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l5:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l5:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l6
	{mso-list-id:2005165080;
	mso-list-type:hybrid;
	mso-list-template-ids:99010748 177007434 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l6:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l6:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l6:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l6:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l6:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l6:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l6:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l6:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l6:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
@list l7
	{mso-list-id:2022971887;
	mso-list-type:hybrid;
	mso-list-template-ids:1438651526 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l7:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l7:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l7:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l7:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="color:windowtext">At cloud
            scale, telemetry and health monitoring is very critical. We
            should define a framework that allows platform owners to add
            their own telemetry hooks. Telemetry service should be
            designed to make this data accessible and store in resilient
            way (like blackbox during plane crash).  <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Is there any
            workgroup that drives this feature “Platform telemetry and
            health monitoring” ?
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Wishlist<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">BMC
            telemetry : <o:p></o:p></span></p>
        <ol style="margin-top:0in" start="1" type="1">
          <li class="MsoListParagraph"
            style="color:windowtext;margin-left:0in;mso-list:l7 level1
            lfo5">
            Linux subsystem<o:p></o:p></li>
          <ol style="margin-top:0in" start="1" type="a">
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Uptime<o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              CPU Load average<o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Memory info<o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Storage usage ( RW )  <o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Dmesg<o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Syslog <o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              FDs of critical processes <o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Alignment traps <o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              WDT excursions <o:p></o:p></li>
          </ol>
          <li class="MsoListParagraph"
            style="color:windowtext;margin-left:0in;mso-list:l7 level1
            lfo5">
            IPMI subsystem<o:p></o:p></li>
          <ol style="margin-top:0in" start="1" type="a">
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Request and Response logging par interface with timestamps
              ( KCS, LAN, USB)<o:p></o:p></li>
            <li class="MsoListParagraph"
              style="color:windowtext;margin-left:0in;mso-list:l7 level2
              lfo5">
              Request and Response of IPMB<o:p></o:p></li>
          </ol>
        </ol>
        <p class="MsoListParagraph"
style="margin-left:1.5in;text-indent:-1.5in;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
          <!--[if !supportLists]--><span style="color:windowtext"><span
              style="mso-list:Ignore"><span style="font:7.0pt
                &quot;Times New Roman&quot;">                                                              
              </span>i.<span style="font:7.0pt &quot;Times New
                Roman&quot;">      </span></span></span><!--[endif]--><span
            style="color:windowtext">Request , Response, No of Retries<o:p></o:p></span></p>
        <ol style="margin-top:0in" start="3" type="1">
          <li class="MsoListParagraph"
            style="color:windowtext;margin-left:0in;mso-list:l7 level1
            lfo5">
            Misc<o:p></o:p></li>
        </ol>
        <ol style="margin-top:0in" start="1" type="a">
          <li class="MsoListParagraph"
            style="color:windowtext;mso-list:l2 level1 lfo8">Critical
            Temperature Excursions
            <o:p></o:p></li>
        </ol>
        <p class="MsoListParagraph"
style="margin-left:1.5in;text-indent:-1.5in;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
          <!--[if !supportLists]--><span style="color:windowtext"><span
              style="mso-list:Ignore"><span style="font:7.0pt
                &quot;Times New Roman&quot;">                                                              
              </span>i.<span style="font:7.0pt &quot;Times New
                Roman&quot;">      </span></span></span><!--[endif]--><span
            style="color:windowtext">Minimum Reading of Sensor<o:p></o:p></span></p>
        <p class="MsoListParagraph"
style="margin-left:1.5in;text-indent:-1.5in;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
          <!--[if !supportLists]--><span style="color:windowtext"><span
              style="mso-list:Ignore"><span style="font:7.0pt
                &quot;Times New Roman&quot;">                                                            
              </span>ii.<span style="font:7.0pt &quot;Times New
                Roman&quot;">      </span></span></span><!--[endif]--><span
            style="color:windowtext">Max Reading of a sensor<o:p></o:p></span></p>
        <p class="MsoListParagraph"
style="margin-left:1.5in;text-indent:-1.5in;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
          <!--[if !supportLists]--><span style="color:windowtext"><span
              style="mso-list:Ignore"><span style="font:7.0pt
                &quot;Times New Roman&quot;">                                                          
              </span>iii.<span style="font:7.0pt &quot;Times New
                Roman&quot;">      </span></span></span><!--[endif]--><span
            style="color:windowtext">Count of state transition<o:p></o:p></span></p>
        <p class="MsoListParagraph"
style="margin-left:1.5in;text-indent:-1.5in;mso-text-indent-alt:-9.0pt;mso-list:l7
          level3 lfo5">
          <!--[if !supportLists]--><span style="color:windowtext"><span
              style="mso-list:Ignore"><span style="font:7.0pt
                &quot;Times New Roman&quot;">                                                          
              </span>iv.<span style="font:7.0pt &quot;Times New
                Roman&quot;">      </span></span></span><!--[endif]--><span
            style="color:windowtext">Retry Count<o:p></o:p></span></p>
        <ol style="margin-top:0in" start="2" type="a">
          <li class="MsoListParagraph" style="mso-list:l2 level1 lfo8">Count
            of assertions/deassertions of GPIO and ability to capture
            the state<o:p></o:p></li>
          <li class="MsoListParagraph" style="mso-list:l2 level1 lfo8">timestamp
            of last assertion/deassertion of GPIO<o:p></o:p></li>
        </ol>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Thanks<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">~Neeraj<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b><span style="color:windowtext">From:</span></b><span
                style="color:windowtext"> openbmc
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org">&lt;openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org&gt;</a>
                <b>On Behalf Of </b>vishwa<br>
                <b>Sent:</b> Wednesday, May 8, 2019 1:11 AM<br>
                <b>To:</b> Kun Yi <a class="moz-txt-link-rfc2396E" href="mailto:kunyi@google.com">&lt;kunyi@google.com&gt;</a>; OpenBMC
                Maillist <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a><br>
                <b>Subject:</b> Re: BMC health metrics (again!)<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p>Hello Kun,<o:p></o:p></p>
        <p>Thanks for initiating it. I liked the /proc parsing. On the
          IPMI thing, is it only targeted to IPMI -or- a generic
          BMC-Host communication kink ?<o:p></o:p></p>
        <p>Some of the things in my wish-list are:<o:p></o:p></p>
        <p>1/. Flash wear and tear detection and the threshold to be a
          config option<br>
          2/. Any SoC specific health checks ( If that is exposed )<br>
          3/. Mechanism to detect spurious interrupts on any HW link<br>
          4/. Some kind of check to see if there will be any I2C lock to
          a given end device<br>
          5/. Ability to detect errors on HW links<o:p></o:p></p>
        <p>On the watchdog(8) area, I was just thinking these:<o:p></o:p></p>
        <p>How about having some kind of BMC_health D-Bus properties
          -or- a compile time feed, whose values can be fed into a
          configuration file than watchdog using the default
          /etc/watchdog.conf always. If the properties are coming from a
          D-Bus, then we could either append to /etc/watchdog.conf -or-
          treat those values only as the config file that can be given
          to watchdog.<br>
          The systemd service files to be setup accordingly.<o:p></o:p></p>
        <p><br>
          We have seen instances where we get an error that is
          indicating no resources available. Those could be file
          descriptors / socket descriptors etc. A way to plug this into
          watchdog as part of test binary that checks for this ? We
          could hook a repair-binary to take the action.<o:p></o:p></p>
        <p><br>
          Another thing that I was looking at hooking into watchdog is
          the test to see the file system usage as defined by the
          policy.<br>
          Policy could mention the file system mounts and also the
          threshold.<br>
          <br>
          For example, /tmp , /root etc.. We could again hook a repair
          binary to do some cleanup if needed<br>
          <br>
          If we see the list is growing with these custom requirements,
          then probably does not make sense to pollute the watchdog(2)
          but<br>
          have these consumed into the app instead ?<o:p></o:p></p>
        <p>!! Vishwa !!<o:p></o:p></p>
        <div>
          <p class="MsoNormal">On 4/9/19 9:55 PM, Kun Yi wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <div>
            <div>
              <div>
                <div>
                  <p class="MsoNormal">Hello there,<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">This topic has been brought up
                    several times on the mailing list and offline, but
                    in general seems we as a community didn't reach a
                    consensus on what things would be the most valuable
                    to monitor, and how to monitor them. While it seems
                    a general purposed monitoring infrastructure for
                    OpenBMC is a hard problem, I have some simple ideas
                    that I hope can provide immediate and direct
                    benefits.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">1. Monitoring host IPMI link
                    reliability (host side)<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">The essentials I want are "IPMI
                    commands sent" and "IPMI commands succeeded" counts
                    over time. More metrics like response time would
                    be helpful as well. The issue to address here: when
                    some IPMI sensor readings are flaky, it would be
                    really helpful to tell from IPMI command stats to
                    determine whether it is a hardware issue, or IPMI
                    issue. Moreover, it would be a very useful
                    regression test metric for rolling out new BMC
                    software.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">Looking at the host IPMI side,
                    there is some metrics exposed
                    through /proc/ipmi/0/si_stats if ipmi_si driver is
                    used, but I haven't dug into whether it contains
                    information mapping to the interrupts. Time to read
                    the source code I guess.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">Another idea would be to
                    instrument caller libraries like the interfaces in
                    ipmitool, though I feel that approach is harder due
                    to fragmentation of IPMI libraries.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">2. Read and expose core BMC
                    performance metrics from procfs<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">This is straightforward: have a
                    smallish daemon (or bmc-state-manager) read,parse,
                    and process procfs and put values on D-Bus. Core
                    metrics I'm interested in getting through this way:
                    load average, memory, disk used/available, net
                    stats... The values can then simply be exported as
                    IPMI sensors or Redfish resource properties.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">A nice byproduct of this effort
                    would be a procfs parsing library. Since different
                    platforms would probably have different monitoring
                    requirements and procfs output format has no
                    standard, I'm thinking the user would just provide a
                    configuration file containing list of (procfs path,
                    property regex, D-Bus property name), and the
                    compile-time generated code to provide an object for
                    each property. <o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">All of this is merely thoughts
                    and nothing concrete. With that said, it would be
                    really great if you could provide some feedback such
                    as "I want this, but I really need that feature", or
                    let me know it's all implemented already :)<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <div>
                  <p class="MsoNormal">If this seems valuable, after
                    gathering more feedback of feature requirements, I'm
                    going to turn them into design docs and upload for
                    review.<o:p></o:p></p>
                </div>
                <div>
                  <p class="MsoNormal"><o:p> </o:p></p>
                </div>
                <p class="MsoNormal">-- <o:p></o:p></p>
                <div>
                  <div>
                    <p class="MsoNormal">Regards, <o:p></o:p></p>
                    <div>
                      <p class="MsoNormal">Kun<o:p></o:p></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------5B1483F5AE95B8D828285942--

