Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E06869F
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 11:49:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nJdd6LpXzDqRX
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 19:49:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nJcg6msjzDqWJ
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 19:48:12 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6F9lRMl084847
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 05:48:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2trp7a2u6u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 05:48:06 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 15 Jul 2019 10:48:05 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Jul 2019 10:48:02 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6F9m1F850397334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 09:48:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3B954C052;
 Mon, 15 Jul 2019 09:48:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 320B54C04E;
 Mon, 15 Jul 2019 09:48:01 +0000 (GMT)
Received: from [9.122.210.94] (unknown [9.122.210.94])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jul 2019 09:48:01 +0000 (GMT)
Subject: Re: bmc_booted LED group was not asserted when BMC started up
To: CS20 YSChu <YSCHU@nuvoton.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 15 Jul 2019 15:18:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------DD421E339FC0370170698A84"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071509-0028-0000-0000-00000384584D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071509-0029-0000-0000-000024447518
Message-Id: <dfd399c9-757c-de7d-f61d-4ec844b9b0b6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150117
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
--------------DD421E339FC0370170698A84
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stanley,

Could you tell:

-- The o/p of "systemctl status obmc-led-group-start@bmc_booted.service"

-- Properties of /xyz/openbmc_project/led/groups/bmc_booted

-- properties of xyz/openbmc_project/led/physical/heartbeat ?

!! Vishwa !!

On 7/15/19 1:57 PM, CS20 YSChu wrote:
>
> Hi,
>
> In normal case, we will see bmc_booted LED group been asserted when 
> bmc starts up.
>
> Apr 08 04:56:30 evb-npcm750 systemd[1]: Starting Wait for 
> /xyz/openbmc_project/led/groups/bmc_booted...
>
> Apr 08 04:56:31 evb-npcm750 systemd[1]: Started Wait for 
> /xyz/openbmc_project/led/groups/bmc_booted.
>
> Apr 08 04:56:35 evb-npcm750 systemd[1]: Starting Assert bmc_booted LED...
>
> Apr 08 04:56:35 evb-npcm750 systemd[1]: Started Assert bmc_booted LED.
>
> Recently, I update to newer commit (don’t know what exact commit cause 
> this), the wanted service was started but bmc-led-group-start service 
> itself was not started. As a result, bmc heartbeat led was not blinked.
>
> Can anyone please advise how to investigate such kind of issue?
>
> Jul 11 04:54:03 runbmc-nuvoton systemd[1]: Starting Wait for 
> /xyz/openbmc_project/led/groups/bmc_booted...
>
> Jul 11 04:54:06 runbmc-nuvoton systemd[1]: Started Wait for 
> /xyz/openbmc_project/led/groups/bmc_booted.
>
> ------
>
> Below is unit file of obmc-led-group-start@bmc_booted.service in 
> /lib/systemd/system/multi-user.target.wants
>
> [Unit]
>
> Description=Assert %i LED
>
> Wants=mapper-wait@-xyz-openbmc_project-led-groups-%i.service
>
> After=mapper-wait@-xyz-openbmc_project-led-groups-%i.service
>
> Conflicts=obmc-led-group-stop@%i.service
>
> [Service]
>
> Type=oneshot
>
> RemainAfterExit=yes
>
> Restart=no
>
> ExecStart=/bin/sh -c "busctl call `mapper get-service 
> /xyz/openbmc_project/led/groups/%i` /xyz/openbmc_project/led/groups/%i 
> org.freedesktop.DBus.Properties Set ssv xyz.openbmc_project.Led.Group 
> Asserted b true"
>
> SyslogIdentifier=obmc-led-group-start
>
> Thanks.
>
> Stanley
>
> ------------------------------------------------------------------------
> The privileged confidential information contained in this email is 
> intended for use only by the addressees as indicated by the original 
> sender of this email. If you are not the addressee indicated in this 
> email or are not responsible for delivery of the email to such a 
> person, please kindly reply to the sender indicating this fact and 
> delete all copies of it from your computer and network server 
> immediately. Your cooperation is highly appreciated. It is advised 
> that any unauthorized use of confidential information of Nuvoton is 
> strictly prohibited; and any information in this email irrelevant to 
> the official business of Nuvoton shall be deemed as neither given nor 
> endorsed by Nuvoton. 

--------------DD421E339FC0370170698A84
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Stanley,</p>
    <p>Could you tell:</p>
    <p>-- The o/p of "systemctl status <span lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a>"</span></p>
    <p><span lang="EN-US">-- Properties of </span><span lang="EN-US">/xyz/openbmc_project/led/groups/bmc_booted</span></p>
    <p><span lang="EN-US">-- properties of
        xyz/openbmc_project/led/physical/heartbeat ?</span></p>
    <p><span lang="EN-US">!! Vishwa !!<br>
      </span></p>
    <div class="moz-cite-prefix">On 7/15/19 1:57 PM, CS20 YSChu wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
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
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
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
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
        <p class="MsoNormal"><span lang="EN-US">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">In normal case, we will
            see bmc_booted LED group been asserted when bmc starts up.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Apr 08 04:56:30
            evb-npcm750 systemd[1]: Starting Wait for
            /xyz/openbmc_project/led/groups/bmc_booted...<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Apr 08 04:56:31
            evb-npcm750 systemd[1]: Started Wait for
            /xyz/openbmc_project/led/groups/bmc_booted.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Apr 08 04:56:35
            evb-npcm750 systemd[1]: Starting Assert bmc_booted LED...<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Apr 08 04:56:35
            evb-npcm750 systemd[1]: Started Assert bmc_booted LED.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Recently, I update to
            newer commit (don’t know what exact commit cause this), the
            wanted service was started but bmc-led-group-start service
            itself was not started. As a result, bmc heartbeat led was
            not blinked.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Can anyone please advise
            how to investigate such kind of issue?<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Jul 11 04:54:03
            runbmc-nuvoton systemd[1]: Starting Wait for
            /xyz/openbmc_project/led/groups/bmc_booted...<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Jul 11 04:54:06
            runbmc-nuvoton systemd[1]: Started Wait for
            /xyz/openbmc_project/led/groups/bmc_booted.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">------<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Below is unit file of
            <a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a> in
            /lib/systemd/system/multi-user.target.wants<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">[Unit]<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Description=Assert %i
            LED<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:Wants=mapper-wait@-xyz-openbmc_project-led-groups-%i.service">Wants=mapper-wait@-xyz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:After=mapper-wait@-xyz-openbmc_project-led-groups-%i.service">After=mapper-wait@-xyz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:Conflicts=obmc-led-group-stop@%i.service">Conflicts=obmc-led-group-stop@%i.service</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">[Service]<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Type=oneshot<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">RemainAfterExit=yes<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Restart=no<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">ExecStart=/bin/sh -c
            "busctl call `mapper get-service
            /xyz/openbmc_project/led/groups/%i`
            /xyz/openbmc_project/led/groups/%i
            org.freedesktop.DBus.Properties Set ssv
            xyz.openbmc_project.Led.Group Asserted b true"<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">SyslogIdentifier=obmc-led-group-start<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Thanks.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Stanley<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
      </div>
      <hr width="100%" align="center">
      <span style="font-size:12pt;line-height:0.7;font-family: 'Arial';
        color:#808080">The privileged confidential information contained
        in this email is intended for use only by the addressees as
        indicated by the original sender of this email. If you are not
        the addressee indicated in this email or are not responsible for
        delivery of the email to such a person, please kindly reply to
        the sender indicating this fact and delete all copies of it from
        your computer and network server immediately. Your cooperation
        is highly appreciated. It is advised that any unauthorized use
        of confidential information of Nuvoton is strictly prohibited;
        and any information in this email irrelevant to the official
        business of Nuvoton shall be deemed as neither given nor
        endorsed by Nuvoton.
      </span>
    </blockquote>
  </body>
</html>

--------------DD421E339FC0370170698A84--

