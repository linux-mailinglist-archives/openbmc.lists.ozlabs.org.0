Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF1EF972
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 10:34:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476ky13MDvzF2Dy
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 20:34:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476kcF1PbWzDsFQ
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 20:18:36 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA59GOmn001580
 for <openbmc@lists.ozlabs.org>; Tue, 5 Nov 2019 04:18:31 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w349q4h0t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2019 04:18:31 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 5 Nov 2019 09:18:28 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Nov 2019 09:18:26 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA59IPgf32047180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 09:18:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3B3FAE04D;
 Tue,  5 Nov 2019 09:18:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9057AE055;
 Tue,  5 Nov 2019 09:18:24 +0000 (GMT)
Received: from [9.85.123.237] (unknown [9.85.123.237])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 09:18:24 +0000 (GMT)
Subject: =?UTF-8?Q?Re=3a_BMC_can=e2=80=99t_get_watchdog_status_by_command_?=
 =?UTF-8?Q?=e2=80=9cmc_watchdog_get=e2=80=9d_when_system_power_is_off?=
To: Wayne Tung/WYHQ/Wiwynn <Wayne_Tung@wiwynn.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK0PR02MB2593B7A84823A34C11AEF363967E0@HK0PR02MB2593.apcprd02.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 5 Nov 2019 14:48:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <HK0PR02MB2593B7A84823A34C11AEF363967E0@HK0PR02MB2593.apcprd02.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------BFBB83FC7CB7E648A72522B9"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19110509-0012-0000-0000-00000360D406
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110509-0013-0000-0000-0000219C2C64
Message-Id: <d408ad0d-d957-ea15-e27a-ef4913b58671@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050080
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
--------------BFBB83FC7CB7E648A72522B9
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Wayne,

Thanks for writing. Here is my thought on this.

- phosphor-watchdog was meant to time the Host booting, and hence it is 
getting started where ever it is.
- There are other external users for watchdog ( like bmcweb ). So we 
need to see if this change affects those.
- Could you help show which section demands this service to be mandatory 
available per IPMI v2.0 ?
- What do you expect IPMI to tell when the host is off ?
- Lastly, please help push a gerrit review, so we could add comments there.

Thanks..

!! Vishwa !!

On 11/5/19 7:09 AM, Wayne Tung/WYHQ/Wiwynn wrote:
>
> Hi,
>
> We met an error that BMC can’t get watchdog status by command “mc 
> watchdog get” when system power is off.
>
> Cause:
>
> "ipmitool mc watchdog get" gets dbus properties in path: 
> /xyz/openbmc_project/watchdog/host0 interface: 
> xyz.openbmc_project.State.Watchdog and this dbus object is registered 
> by phosphor-watchdog.service.
>
> Because phosphor-watchdog.service will not be started before system 
> power-on and will be stopped after system power-off, therefore 
> "ipmitool mc watchdog get" command gets nothing when system power is off.
>
> Follow the standard, BMC should still report watchdog status even if 
> system power is off.
>
> So we modified phosphor-watchdog’s bb file and service file to
> 1. Start phosphor-watchdog after multi-user.target during BMC boot period
>
> 2. Do not stop phosphor-watchdog when system power off.
>
> 3. Always restart phosphor-watchdog.service.
>
> Test Result:
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> chassis power status
>
> Chassis Power is off
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> bmc watchdog get
>
> Watchdog Timer Use:     BIOS FRB2 (0x81)
>
> Watchdog Timer Is:      Stopped
>
> Watchdog Timer Actions: No action (0x00)
>
> Pre-timeout interval:   0 seconds
>
> Timer Expiration Flags: 0x00
>
> Initial Countdown:      0 sec
>
> Present Countdown:      0 sec
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> chassis power on
>
> Chassis Power Control: Up/On
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> bmc watchdog get
>
> Watchdog Timer Use:     BIOS FRB2 (0xc1)
>
> Watchdog Timer Is:      Started/Running
>
> Watchdog Timer Actions: Hard Reset (0x01)
>
> Pre-timeout interval:   0 seconds
>
> Timer Expiration Flags: 0x00
>
> Initial Countdown:      600 sec
>
> Present Countdown:      597 sec
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> bmc watchdog get
>
> Watchdog Timer Use:     BIOS FRB2 (0xc1)
>
> Watchdog Timer Is:      Started/Running
>
> Watchdog Timer Actions: Hard Reset (0x01)
>
> Pre-timeout interval:   0 seconds
>
> Timer Expiration Flags: 0x00
>
> Initial Countdown:      600 sec
>
> Present Countdown:      582 sec
>
> wayne@TGA:~$ ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus 
> bmc watchdog get
>
> Watchdog Timer Use:     BIOS FRB2 (0x81)
>
> Watchdog Timer Is:      Stopped
>
> Watchdog Timer Actions: No action (0x00)
>
> Pre-timeout interval:   0 seconds
>
> Timer Expiration Flags: 0x00
>
> Initial Countdown:      0 sec
>
> Present Countdown:      0 sec
>
> Thanks
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>
> *This email contains confidential or legally privileged information 
> and is for the sole use of its intended recipient. *
>
> *Any unauthorized review, use, copying or distribution of this email 
> or the content of this email is strictly prohibited.*
>
> *If you are not the intended recipient, you may reply to the sender 
> and should delete this e-mail immediately.*
>
> *---------------------------------------------------------------------------------------------------------------------------------------------------------------*
>

--------------BFBB83FC7CB7E648A72522B9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Wayne,</p>
    <p>Thanks for writing. Here is my thought on this.</p>
    <p>- phosphor-watchdog was meant to time the Host booting, and hence
      it is getting started where ever it is.<br>
      - There are other external users for watchdog ( like bmcweb ). So
      we need to see if this change affects those.<br>
      - Could you help show which section demands this service to be
      mandatory available per IPMI v2.0 ?<br>
      - What do you expect IPMI to tell when the host is off ?<br>
      - Lastly, please help push a gerrit review, so we could add
      comments there.</p>
    <p>Thanks..<br>
    </p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 11/5/19 7:09 AM, Wayne
      Tung/WYHQ/Wiwynn wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK0PR02MB2593B7A84823A34C11AEF363967E0@HK0PR02MB2593.apcprd02.prod.outlook.com">
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
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
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
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">We met an error that BMC can’t get watchdog
            status by command “mc watchdog get” when system power is
            off.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">Cause:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">"ipmitool mc watchdog get" gets dbus properties
            in path: /xyz/openbmc_project/watchdog/host0 interface:
            xyz.openbmc_project.State.Watchdog and this dbus object is
            registered by phosphor-watchdog.service. <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">Because phosphor-watchdog.service will not be
            started before system power-on and will be stopped after
            system power-off, therefore "ipmitool mc watchdog get"
            command gets nothing when system power is off.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">Follow the standard, BMC should still report
            watchdog status even if system power is off.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">So we modified phosphor-watchdog’s bb file and
            service file to
            <br>
            1. Start phosphor-watchdog after multi-user.target during
            BMC boot period<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">2. Do not stop phosphor-watchdog when system
            power off.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">3. Always restart phosphor-watchdog.service.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Test
            Result:<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus
            chassis power status<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Chassis
            Power is off<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc
            watchdog get<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Use:     BIOS FRB2 (0x81)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Is:      Stopped<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Actions: No action (0x00)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Pre-timeout
            interval:   0 seconds<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Timer
            Expiration Flags: 0x00<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Initial
            Countdown:      0 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Present
            Countdown:      0 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus
            chassis power on<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Chassis
            Power Control: Up/On<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc
            watchdog get<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Use:     BIOS FRB2 (0xc1)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Is:      Started/Running<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Actions: Hard Reset (0x01)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Pre-timeout
            interval:   0 seconds<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Timer
            Expiration Flags: 0x00<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Initial
            Countdown:      600 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Present
            Countdown:      597 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc
            watchdog get<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Use:     BIOS FRB2 (0xc1)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Is:      Started/Running<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Actions: Hard Reset (0x01)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Pre-timeout
            interval:   0 seconds<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Timer
            Expiration Flags: 0x00<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Initial
            Countdown:      600 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Present
            Countdown:      582 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">wayne@TGA:~$
            ipmitool -H 10.248.42.74 -U root -P 0penBmc -I lanplus bmc
            watchdog get<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Use:     BIOS FRB2 (0x81)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Is:      Stopped<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Watchdog
            Timer Actions: No action (0x00)<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Pre-timeout
            interval:   0 seconds<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Timer
            Expiration Flags: 0x00<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Initial
            Countdown:      0 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Times New
            Roman&quot;,serif;color:black;background:white" lang="EN-US">Present
            Countdown:      0 sec<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;color:black;background:white"
            lang="EN-US">Thanks<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
      </div>
      <p><span style="font-family:'Calibri';font-size:11pt;
          color:#000000;"><b>---------------------------------------------------------------------------------------------------------------------------------------------------------------</b></span></p>
      <p><span style="font-family:'Calibri';font-size:11pt;
          color:#000000;"><b>This email contains confidential or legally
            privileged information and is for the sole use of its
            intended recipient. </b></span></p>
      <p><span style="font-family:'Calibri';font-size:11pt;
          color:#000000;"><b>Any unauthorized review, use, copying or
            distribution of this email or the content of this email is
            strictly prohibited.</b></span></p>
      <p><span style="font-family:'Calibri';font-size:11pt;
          color:#000000;"><b>If you are not the intended recipient, you
            may reply to the sender and should delete this e-mail
            immediately.</b></span></p>
      <p><span style="font-family:'Calibri';font-size:11pt;
          color:#000000;"><b>---------------------------------------------------------------------------------------------------------------------------------------------------------------</b></span></p>
    </blockquote>
  </body>
</html>

--------------BFBB83FC7CB7E648A72522B9--

