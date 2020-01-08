Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BF134080
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 12:30:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t6W42qvJzDqSt
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 22:30:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t6Tz5b9WzDqSH
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 22:29:42 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008BS8Kv127035
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 06:29:39 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8saw7rf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 06:29:38 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 8 Jan 2020 11:29:37 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 8 Jan 2020 11:29:35 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 008BTYDw45154786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 11:29:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25FF9AE053
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 11:29:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BCC2AE058
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 11:29:33 +0000 (GMT)
Received: from [9.202.12.60] (unknown [9.202.12.60])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 11:29:33 +0000 (GMT)
Subject: Re: Creating VLAN always fails and the phosphor network service aborts
To: openbmc@lists.ozlabs.org
References: <MWHPR13MB13602B21B761EAA71B9A4E9EED3E0@MWHPR13MB1360.namprd13.prod.outlook.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 8 Jan 2020 16:59:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR13MB13602B21B761EAA71B9A4E9EED3E0@MWHPR13MB1360.namprd13.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------AB306C900946677E08103A53"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010811-0012-0000-0000-0000037B8D00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010811-0013-0000-0000-000021B7AB56
Message-Id: <9a48bc74-e5f3-1a47-4ddd-9cb8122a5dbe@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_03:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001080098
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
--------------AB306C900946677E08103A53
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Troy,

Let me see this, it was working before.I will push a fix for the same.

Regards
Ratan


On 08/01/20 3:43 PM, Troy.Lee@vertiv.com wrote:
>
> Hi Team,
>
> We met an issue that creating a VLAN is always fail, and the 
> phosphor-network-manager/systemd-networkd are caught abort signal.
>
> Does anyone have any thought about this?
>
> root@ ast2500evb:~# ps | grep network
>
> 4432 root      8804 S    phosphor-network-manager
>
> 4444 systemd- 16828 S    /lib/systemd/systemd-networkd
>
> root@ ast2500evb:~# busctl --no-pager call xyz.openbmc_project.Network \
>
> /xyz/openbmc_project/network \
>
> xyz.openbmc_project.Network.VLAN.Create \
>
>                                    VLAN su "eth0" 123
>
> Call failed: Remote peer disconnected
>
> root@ ast2500evb:~# ps | grep network
>
> 4489 root      8804 S    phosphor-network-manager
>
> 4500 systemd-  1448 R    /lib/systemd/systemd-networkd
>
> Journal log has the following error:
>
> Jan 01 00:21:10 ast2500evb phosphor-network-manager[4432]: Refreshing 
> the objects.
>
> Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]:ioctl failed 
> for SIOCETHTOOL:
>
> Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]: ioctl 
> failed for SIOCETHTOOL:
>
> Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]: Refreshing 
> complete.
>
> Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: ioctl 
> failed for SIOCGIFHWADDR:
>
> Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: terminate 
> called after throwing an instance of 
> 'sdbusplus::xyz::openbmc_project::Common::Error::InternalFailure'
>
> Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: what():  
> xyz.openbmc_project.Common.Error.InternalFailure: The operation failed 
> internally.
>
> Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: The 
> operation failed internally.
>
> Jan 01 00:21:13 ast2500evb systemd[1]: 
> xyz.openbmc_project.Network.service: Main process exited, code=killed, 
> status=6/ABRT
>
> Jan 01 00:21:13 ast2500evb systemd[1]: 
> xyz.openbmc_project.Network.service: Failed with result 'signal'.
>
> Jan 01 00:21:14 ast2500evb systemd[1]: 
> xyz.openbmc_project.Network.service: Service RestartSec=1s expired, 
> scheduling restart.
>
> Jan 01 00:21:14 ast2500evb systemd[1]: 
> xyz.openbmc_project.Network.service: Scheduled restart job, restart 
> counter is at 3.
>
> Jan 01 00:21:14 ast2500evb systemd[1]: Stopped Phosphor Network Manager.
>
> Jan 01 00:21:14 ast2500evb systemd[1]: Starting Phosphor Network 
> Manager...
>
> Jan 01 00:21:14 ast2500evb systemd[1]: Started Phosphor Network Manager.
>
> Jan 01 00:21:17 ast2500evb systemd[1]: Stopping Network Service...
>
> Jan 01 00:21:18 ast2500evb systemd[1]: systemd-networkd.service: 
> Succeeded.
>
> Jan 01 00:21:18 ast2500evb systemd[1]: Stopped Network Service.
>
> Jan 01 00:21:18 ast2500evb systemd[1]: Starting Network Service...
>
> Thanks,
>
> Troy Lee
>
> CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it 
> are intended solely for the use of the individual or entity to whom 
> they are addressed and may contain confidential and privileged 
> information protected by law. If you received this e-mail in error, 
> any review, use, dissemination, distribution, or copying of the e-mail 
> is strictly prohibited. Please notify the sender immediately by return 
> e-mail and delete all copies from your system. 

--------------AB306C900946677E08103A53
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Troy,</p>
    <p>Let me see this, it was working before.I will push a fix for the
      same.<br>
    </p>
    Regards<br>
    Ratan
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/01/20 3:43 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:Troy.Lee@vertiv.com">Troy.Lee@vertiv.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:MWHPR13MB13602B21B761EAA71B9A4E9EED3E0@MWHPR13MB1360.namprd13.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Hi
            Team,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">We
            met an issue that creating a VLAN is always fail, and the
            phosphor-network-manager/systemd-networkd are caught abort
            signal.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Does
            anyone have any thought about this?<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">root@
            ast2500evb:~# ps | grep network<o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:6.0pt"><span
            style="font-size:12.0pt" lang="EN-US">4432 root      8804
            S    phosphor-network-manager<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">4444
            systemd- 16828 S    /lib/systemd/systemd-networkd<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">root@
            ast2500evb:~# busctl --no-pager call
            xyz.openbmc_project.Network \<o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:216.0pt"><span
            style="font-size:12.0pt" lang="EN-US">/xyz/openbmc_project/network
            \<o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:216.0pt"><span
            style="font-size:12.0pt" lang="EN-US">xyz.openbmc_project.Network.VLAN.Create
            \<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">                                   VLAN
            su "eth0" 123<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt;color:red"
            lang="EN-US">Call failed: Remote peer disconnected</span><span
            style="font-size:12.0pt" lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">root@
            ast2500evb:~# ps | grep network<o:p></o:p></span></p>
        <p class="MsoNormal" style="text-indent:6.0pt"><span
            style="font-size:12.0pt" lang="EN-US">4489 root      8804
            S    phosphor-network-manager<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">4500
            systemd-  1448 R    /lib/systemd/systemd-networkd<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Journal
            log has the following error:<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:10 ast2500evb phosphor-network-manager[4432]:
            Refreshing the objects.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:11 ast2500evb phosphor-network-manager[4432]:<span
              style="color:red"> ioctl failed for SIOCETHTOOL:</span><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:11 ast2500evb phosphor-network-manager[4432]:
            <span style="color:red">ioctl failed for SIOCETHTOOL:</span><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:11 ast2500evb phosphor-network-manager[4432]:
            Refreshing complete.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb phosphor-network-manager[4432]:
            <span style="color:red">ioctl failed for SIOCGIFHWADDR:</span><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb phosphor-network-manager[4432]:
            terminate called after throwing an instance of
            'sdbusplus::xyz::openbmc_project::Common::Error::InternalFailure'<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb phosphor-network-manager[4432]:  
            what():  xyz.openbmc_project.Common.Error.InternalFailure:
            The operation failed internally.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb phosphor-network-manager[4432]: The
            operation failed internally.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb systemd[1]:
            <span style="color:red">xyz.openbmc_project.Network.service:
              Main process exited, code=killed, status=6/ABRT</span><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:13 ast2500evb systemd[1]:
            <span style="color:red">xyz.openbmc_project.Network.service:
              Failed with result 'signal'.</span><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:14 ast2500evb systemd[1]:
            xyz.openbmc_project.Network.service: Service RestartSec=1s
            expired, scheduling restart.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:14 ast2500evb systemd[1]:
            xyz.openbmc_project.Network.service: Scheduled restart job,
            restart counter is at 3.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:14 ast2500evb systemd[1]: Stopped Phosphor Network
            Manager.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:14 ast2500evb systemd[1]: Starting Phosphor Network
            Manager...<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:14 ast2500evb systemd[1]: Started Phosphor Network
            Manager.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:17 ast2500evb systemd[1]: Stopping Network
            Service...<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:18 ast2500evb systemd[1]: systemd-networkd.service:
            Succeeded.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:18 ast2500evb systemd[1]: Stopped Network Service.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Jan
            01 00:21:18 ast2500evb systemd[1]: Starting Network
            Service...<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Thanks,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt" lang="EN-US">Troy
            Lee<o:p></o:p></span></p>
      </div>
      CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with
      it are intended solely for the use of the individual or entity to
      whom they are addressed and may contain confidential and
      privileged information protected by law. If you received this
      e-mail in error, any review, use, dissemination, distribution, or
      copying of the e-mail is strictly prohibited. Please notify the
      sender immediately by return e-mail and delete all copies from
      your system.
    </blockquote>
  </body>
</html>

--------------AB306C900946677E08103A53--

