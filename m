Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAD611C626
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:00:24 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YPnb4jrrzDqwW
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 18:00:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YPmZ3p3QzDqgC
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 17:59:25 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBC6w4fG022092
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 01:59:16 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wu4t6uk9j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 01:59:16 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 12 Dec 2019 06:59:14 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Dec 2019 06:59:12 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBC6xArc53608452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Dec 2019 06:59:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22C434C040;
 Thu, 12 Dec 2019 06:59:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA26F4C05C;
 Thu, 12 Dec 2019 06:59:08 +0000 (GMT)
Received: from [9.122.210.247] (unknown [9.122.210.247])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Dec 2019 06:59:08 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
To: Neeraj Ladkani <neladk@microsoft.com>
Subject: Re: [EXTERNAL] Re: Managing heterogeneous systems
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
 <cb3fe45e-72b8-9910-9dda-b9127bf74fdc@linux.vnet.ibm.com>
 <DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
Date: Thu, 12 Dec 2019 12:29:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------1C7A9E4E7860AA1E753D3315"
X-TM-AS-GCONF: 00
x-cbid: 19121206-0020-0000-0000-0000039759A3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121206-0021-0000-0000-000021EE6097
Message-Id: <21b9654b-1e40-804b-a607-e156c848ad85@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_01:2019-12-12,2019-12-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912120045
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
Cc: "sgundura@in.ibm.com" <sgundura@in.ibm.com>,
 "shahjsha@in.ibm.com" <shahjsha@in.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vikantan@in.ibm.com" <vikantan@in.ibm.com>,
 "kusripat@in.ibm.com" <kusripat@in.ibm.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------1C7A9E4E7860AA1E753D3315
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/19 3:20 PM, Neeraj Ladkani wrote:
>
> Great discussion.
>
> The problem is not physical interface as they can communicate using 
> LAN. The problem is entity binding as one compute node can be 
> connected to 1 or more storage nodes. How can we have one view of 
> system from operational perspective? Power on/off, SEL logs, telemetry?
>


Correct. This is where I mentioned about "Primary BMC acting as Point Of 
Contact" for external requests.
Depending on how we want to service the request, we could orchestrate 
that via PoC BMC or respond to external requesters on where they can get 
the data and they connect to 'em directly.

!! Vishwa !!

> Some of problems :
>
>  1. Power operations : Power/resets/ need to be coordinated in all
>     nodes in a system
>  2. Telemetry : OS runs only on head node so if there are requests to
>     read telemetry, it should get telemetry ( SEL logs, Sensor Values
>     ) from all the nodes.
>  3. Firmware Update
>  4. RAS: Memory errors are logged by UEFI SMM in to head node but
>     corresponding DIMM temperature , inlet temperature are logged on
>     secondary node which are not mapped.
>
> I have been exploring couple of routes
>
>  1. LUN  discovery and routing: this is similar to IPMI but I am
>     working on architecture to extend this to support multiple LUNs
>     and route them from Head node. ( we would need LUN routing over LAN )
>  2. Redfish hierarchy for systems
>
>    "Systems": {
>         "@odata.id": "/redfish/v1/Systems"
>     },
>     "Chassis": {
>         "@odata.id": "/redfish/v1/Chassis"
>     },
>     "Managers": {
>         "@odata.id": "/redfish/v1/Managers"
>     },
>     "AccountService": {
>         "@odata.id": "/redfish/v1/AccountService"
>     },
>     "SessionService": {
>         "@odata.id": "/redfish/v1/SessionService"
>     },
>     "Links": {
>         "Sessions": {
>             "@odata.id": "/redfish/v1/SessionService/Sessions"
>         }
> 3.Custom Messaging over LAN ( PubSub)
>
> I am also working on a whitepaper on same area J.  Happy to work with 
> you guys if you have any ideas on how can we standardize this.
>
> Neeraj
>
> *From:*vishwa <vishwa@linux.vnet.ibm.com>
> *Sent:* Tuesday, December 10, 2019 1:00 AM
> *To:* Richard Hanley <rhanley@google.com>; Neeraj Ladkani 
> <neladk@microsoft.com>
> *Cc:* openbmc@lists.ozlabs.org; sgundura@in.ibm.com; 
> kusripat@in.ibm.com; shahjsha@in.ibm.com; vikantan@in.ibm.com
> *Subject:* [EXTERNAL] Re: Managing heterogeneous systems
>
> Hi Richard / Neeraj,
>
> Thanks for bringing this up. It's one of the interesting topic for IBM.
>
> Some of the thoughts here.....
>
> When we have multiple BMCs as part of a single system, then there are 
> 3 main parts into it.
>
> 1/. Discovering the peer BMCs and role assignment
> 2/. Monitoring the existence of peer BMCs - heartbeat
> 3/. In the event of loosing the master, detect so using #2 and then 
> reassign the role
>
> Depending on how we want to establish the roles, we could have 
> Single-Master, Many-slave or Multi-Master, Multi-Slave. etc
>
> One of the team here is trying to do a POC for Multi BMC architecture 
> and is still in the very beginning stage.
> The team is currently studying/evaluating the available solution - 
> Corosync / Heartbeat / Pacemaker".
> Corosync works nice with the clusters, but we need to see if we can 
> trim it down for BMC.
>
> If we can not use corosync for some reason, then need to see if we can 
> use the discovery using PLDM ( probably use the terminus IDs )
> and come up with custom rules for assigning Master-Slave roles.
>
> If we choose to have Single-Master and Many-Slave, we could have that 
> Single-Master as an entity acting as a Point of Contact for external 
> request and then could orchestrate with the needed BMCs internally to 
> get the job done
>
> I will be happy to know if there are alternatives that suit BMC kind 
> of an architecture
>
> !! Vishwa !!
>
> On 12/10/19 4:32 AM, Richard Hanley wrote:
>
>     Hi Neeraj,
>
>     This is an open question that I've been looking into as well.
>
>     For BMC to BMC communication there are a few options.
>
>      1. If you have network connectivity you can communicate using
>         Redfish.
>      2. If you only have a PCIe connection, you'll have to use either
>         the inband connection or the side band I2C*. PLDM and MCTP are
>         protocols that defined to handle this use case, although I'm
>         not sure if the OpenBMC implementations have been used in
>         production.
>      3. There is always IPMI, which has its own pros/cons.
>
>     For taking several BMCs and aggregating them into a single logical
>     interface that is exposed to the outside world, there are a few
>     things happening on that front.  DMTF has been working on an
>     aggregation protocol for Redfish.  However, it's my understanding
>     that their proposal is more directed at the client level, as
>     opposed to within a single "system".
>
>     I just recently joined the community, but I've been thinking about
>     how a proxy layer could merge two Redfish services together. 
>     Since Redfish is fairly strongly typed and has a well defined
>     mechanism for OEM extensions, this should be pretty generally
>     applicable.  I am planning on having a white paper on the issue
>     sometime after the holidays.
>
>     Another thing to note, recently DMTF released a spec for running a
>     binary Redfish over PLDM called RDE.  That might be a useful way
>     of tying all these concepts together.
>
>     I'd be curious about your thoughts and use cases here.  Would
>     either PLDM or Redfish fit your use case?
>
>     Regards,
>
>     Richard
>
>     *I've heard of some proposals that run a network interface over
>     PCIe.  I don't know enough about PCIe to know if this is a good idea.
>
>     On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani
>     <neladk@microsoft.com <mailto:neladk@microsoft.com>> wrote:
>
>         Are there any standards in managing heterogeneous systems? For
>         example in a rack if there is a compute node( with its own
>         BMC) and storage node( with its own BMC) connected using a
>         PCIe switch.  How these two BMC represented as one system ?
>          are there any standards for BMC – BMC communication?
>
>         Neeraj
>

--------------1C7A9E4E7860AA1E753D3315
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/10/19 3:20 PM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:windowtext;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
	{mso-list-id:729839584;
	mso-list-type:hybrid;
	mso-list-template-ids:-140484154 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
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
	{mso-list-id:1727483152;
	mso-list-type:hybrid;
	mso-list-template-ids:1314007658 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
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
	{mso-list-id:2020548198;
	mso-list-template-ids:-442833286;}
@list l2:level1
	{mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
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
        <p class="MsoNormal"><span style="color:#002060">Great
            discussion. <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060">The problem is
            not physical interface as they can communicate using LAN.
            The problem is entity binding as one compute node can be
            connected to 1 or more storage nodes. How can we have one
            view of system from operational perspective? Power on/off,
            SEL logs, telemetry? </span></p>
      </div>
    </blockquote>
    <div><br>
    </div>
    <div><br>
      Correct. This is where I mentioned about "Primary BMC acting as
      Point Of Contact" for external requests.<br>
      Depending on how we want to service the request, we could
      orchestrate that via PoC BMC or respond to external requesters on
      where they can get the data and they connect to 'em directly.<br>
    </div>
    <div><br>
      !! Vishwa !!<br>
      <br>
    </div>
    <blockquote type="cite"
cite="mid:DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="color:#002060"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060">Some of
            problems :<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <ol style="margin-top:0in" start="1" type="1">
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l0 level1
            lfo3">
            Power operations : Power/resets/ need to be coordinated in
            all nodes in a system <o:p>
            </o:p></li>
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l0 level1
            lfo3">
            Telemetry : OS runs only on head node so if there are
            requests to read telemetry, it should get telemetry ( SEL
            logs, Sensor Values ) from all the nodes.
            <o:p></o:p></li>
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l0 level1
            lfo3">
            Firmware Update<o:p></o:p></li>
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l0 level1
            lfo3">
            RAS: Memory errors are logged by UEFI SMM in to head node
            but corresponding DIMM temperature , inlet temperature are
            logged on secondary node which are not mapped.  <o:p></o:p></li>
        </ol>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060">I have been
            exploring couple of routes
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <ol style="margin-top:0in" start="1" type="1">
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l1 level1
            lfo2">
            LUN  discovery and routing: this is similar to IPMI but I am
            working on architecture to extend this to support multiple
            LUNs and route them from Head node. ( we would need LUN
            routing over LAN )
            <o:p></o:p></li>
          <li class="MsoListParagraph"
            style="color:#002060;margin-left:0in;mso-list:l1 level1
            lfo2">
            Redfish hierarchy for systems <o:p></o:p></li>
        </ol>
        <pre><span style="color:black">   "Systems": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "@odata.id": "/redfish/v1/Systems"<o:p></o:p></span></pre>
        <pre><span style="color:black">    },<o:p></o:p></span></pre>
        <pre><span style="color:black">    "Chassis": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "@odata.id": "/redfish/v1/Chassis"<o:p></o:p></span></pre>
        <pre><span style="color:black">    },<o:p></o:p></span></pre>
        <pre><span style="color:black">    "Managers": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "@odata.id": "/redfish/v1/Managers"<o:p></o:p></span></pre>
        <pre><span style="color:black">    },<o:p></o:p></span></pre>
        <pre><span style="color:black">    "AccountService": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "@odata.id": "/redfish/v1/AccountService"<o:p></o:p></span></pre>
        <pre><span style="color:black">    },<o:p></o:p></span></pre>
        <pre><span style="color:black">    "SessionService": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "@odata.id": "/redfish/v1/SessionService"<o:p></o:p></span></pre>
        <pre><span style="color:black">    },<o:p></o:p></span></pre>
        <pre><span style="color:black">    "Links": {<o:p></o:p></span></pre>
        <pre><span style="color:black">        "Sessions": {<o:p></o:p></span></pre>
        <pre><span style="color:black">            "@odata.id": "/redfish/v1/SessionService/Sessions"<o:p></o:p></span></pre>
        <pre><span style="color:black">        }<o:p></o:p></span></pre>
        <pre style="margin-left:.5in;text-indent:-.25in;mso-list:l1 level1 lfo2"><!--[if !supportLists]--><span style="color:black"><span style="mso-list:Ignore">3.<span style="font:7.0pt &quot;Times New Roman&quot;">  </span></span></span><!--[endif]--><span style="font-family:&quot;Calibri&quot;,sans-serif;color:#002060">Custom Messaging over LAN ( PubSub)</span><span style="color:black"><o:p></o:p></span></pre>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060">I am also
            working on a whitepaper on same area
          </span><span style="font-family:Wingdings;color:#002060">J</span><span
            style="color:#002060">.  Happy to work with you guys if you
            have any ideas on how can we standardize this.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#002060">Neeraj<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b><span style="color:windowtext">From:</span></b><span
                style="color:windowtext"> vishwa
                <a class="moz-txt-link-rfc2396E" href="mailto:vishwa@linux.vnet.ibm.com">&lt;vishwa@linux.vnet.ibm.com&gt;</a>
                <br>
                <b>Sent:</b> Tuesday, December 10, 2019 1:00 AM<br>
                <b>To:</b> Richard Hanley <a class="moz-txt-link-rfc2396E" href="mailto:rhanley@google.com">&lt;rhanley@google.com&gt;</a>;
                Neeraj Ladkani <a class="moz-txt-link-rfc2396E" href="mailto:neladk@microsoft.com">&lt;neladk@microsoft.com&gt;</a><br>
                <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:sgundura@in.ibm.com">sgundura@in.ibm.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:kusripat@in.ibm.com">kusripat@in.ibm.com</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:shahjsha@in.ibm.com">shahjsha@in.ibm.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:vikantan@in.ibm.com">vikantan@in.ibm.com</a><br>
                <b>Subject:</b> [EXTERNAL] Re: Managing heterogeneous
                systems<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p>Hi Richard / Neeraj,<o:p></o:p></p>
        <p>Thanks for bringing this up. It's one of the interesting
          topic for IBM.<o:p></o:p></p>
        <p>Some of the thoughts here.....<o:p></o:p></p>
        <p>When we have multiple BMCs as part of a single system, then
          there are 3 main parts into it.<o:p></o:p></p>
        <p>1/. Discovering the peer BMCs and role assignment<br>
          2/. Monitoring the existence of peer BMCs - heartbeat <br>
          3/. In the event of loosing the master, detect so using #2 and
          then reassign the role<o:p></o:p></p>
        <p>Depending on how we want to establish the roles, we could
          have Single-Master, Many-slave or Multi-Master, Multi-Slave.
          etc<o:p></o:p></p>
        <p>One of the team here is trying to do a POC for Multi BMC
          architecture and is still in the very beginning stage.
          <br>
          The team is currently studying/evaluating the available
          solution - Corosync / Heartbeat / Pacemaker".<br>
          Corosync works nice with the clusters, but we need to see if
          we can trim it down for BMC.<br>
          <br>
          If we can not use corosync for some reason, then need to see
          if we can use the discovery using PLDM ( probably use the
          terminus IDs )<br>
          and come up with custom rules for assigning Master-Slave
          roles.<o:p></o:p></p>
        <p>If we choose to have Single-Master and Many-Slave, we could
          have that Single-Master as an entity acting as a Point of
          Contact for external request and then could orchestrate with
          the needed BMCs internally to get the job done<o:p></o:p></p>
        <p>I will be happy to know if there are alternatives that suit
          BMC kind of an architecture<o:p></o:p></p>
        <p>!! Vishwa !!<o:p></o:p></p>
        <div>
          <p class="MsoNormal">On 12/10/19 4:32 AM, Richard Hanley
            wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <div>
            <p class="MsoNormal">Hi Neeraj, <o:p></o:p></p>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">This is an open question that I've
                been looking into as well.  <o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">For BMC to BMC communication there
                are a few options.<o:p></o:p></p>
            </div>
            <div>
              <ol start="1" type="1">
                <li class="MsoNormal"
                  style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l2
                  level1 lfo1">
                  If you have network connectivity you can communicate
                  using Redfish.<o:p></o:p></li>
                <li class="MsoNormal"
                  style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l2
                  level1 lfo1">
                  If you only have a PCIe connection, you'll have to use
                  either the inband connection or the side band I2C*. 
                  PLDM and MCTP are protocols that defined to handle
                  this use case, although I'm not sure if the OpenBMC
                  implementations have been used in production.<o:p></o:p></li>
                <li class="MsoNormal"
                  style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l2
                  level1 lfo1">
                  There is always IPMI, which has its own pros/cons.<o:p></o:p></li>
              </ol>
              <div>
                <p class="MsoNormal">For taking several BMCs and
                  aggregating them into a single logical interface that
                  is exposed to the outside world, there are a few
                  things happening on that front.  DMTF has been working
                  on an aggregation protocol for Redfish.  However, it's
                  my understanding that their proposal is more directed
                  at the client level, as opposed to within a single
                  "system".<o:p></o:p></p>
              </div>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">I just recently joined the community,
                but I've been thinking about how a proxy layer could
                merge two Redfish services together.  Since Redfish is
                fairly strongly typed and has a well defined mechanism
                for OEM extensions, this should be pretty generally
                applicable.  I am planning on having a white paper on
                the issue sometime after the holidays.<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Another thing to note, recently DMTF
                released a spec for running a binary Redfish over PLDM
                called RDE.  That might be a useful way of tying all
                these concepts together.  <o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">I'd be curious about your thoughts
                and use cases here.  Would either PLDM or Redfish fit
                your use case?<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Regards,<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Richard<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal"><o:p> </o:p></p>
            </div>
            <div>
              <p class="MsoNormal">*I've heard of some proposals that
                run a network interface over PCIe.  I don't know enough
                about PCIe to know if this is a good idea.<o:p></o:p></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <div>
              <p class="MsoNormal">On Mon, Dec 9, 2019 at 1:27 PM Neeraj
                Ladkani &lt;<a href="mailto:neladk@microsoft.com"
                  target="_blank" moz-do-not-send="true">neladk@microsoft.com</a>&gt;
                wrote:<o:p></o:p></p>
            </div>
            <blockquote style="border:none;border-left:solid #CCCCCC
              1.0pt;padding:0in 0in 0in
              6.0pt;margin-left:4.8pt;margin-right:0in">
              <div>
                <div>
                  <p class="MsoNormal"
                    style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto">Are
                    there any standards in managing heterogeneous
                    systems? For example in a rack if there is a compute
                    node( with its own BMC) and storage node( with its
                    own BMC) connected using a PCIe switch.  How these
                    two BMC represented as one system ?  are there any
                    standards for BMC – BMC communication?
                    <o:p></o:p></p>
                  <p class="MsoNormal"
                    style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"> <o:p></o:p></p>
                  <p class="MsoNormal"
                    style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"> <o:p></o:p></p>
                  <p class="MsoNormal"
                    style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto">Neeraj<o:p></o:p></p>
                  <p class="MsoNormal"
                    style="mso-margin-top-alt:auto;mso-margin-bottom-alt:auto"> <o:p></o:p></p>
                </div>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------1C7A9E4E7860AA1E753D3315--

