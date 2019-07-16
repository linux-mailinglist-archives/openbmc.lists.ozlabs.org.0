Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496A6A4AF
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 11:13:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nvpH0KX8zDqSw
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 19:13:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nvnd0099zDqDl
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 19:13:08 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6G9AN8h140847
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 05:13:03 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ts9gk5vr3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 05:13:03 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 16 Jul 2019 10:13:01 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 10:12:59 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6G9CwKQ44630170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 09:12:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519E5A4062;
 Tue, 16 Jul 2019 09:12:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABB42A405F;
 Tue, 16 Jul 2019 09:12:57 +0000 (GMT)
Received: from [9.122.210.243] (unknown [9.122.210.243])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 09:12:57 +0000 (GMT)
Subject: Re: bmc_booted LED group was not asserted when BMC started up
To: CS20 YSChu <YSCHU@nuvoton.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com>
 <dfd399c9-757c-de7d-f61d-4ec844b9b0b6@linux.vnet.ibm.com>
 <HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0@HK2PR03MB4516.apcprd03.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 16 Jul 2019 14:42:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0@HK2PR03MB4516.apcprd03.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------D02F697A50916BC39E744F41"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071609-4275-0000-0000-0000034D61D9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071609-4276-0000-0000-0000385D7329
Message-Id: <cd6b719d-0bb0-9ebf-5a57-d85c2307285d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160117
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
--------------D02F697A50916BC39E744F41
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hmm.,,

Clearly, the systemd unit did not run / was not loaded successfully etc. 
Below line is telling me that some edits were done.

Warning: The unit file, source configuration file or drop-ins of 
obmc-led-group-start@bmc_booted.service changed on disk. Run 'systemctl 
daemon-reload' to reload units.

Have you tried to reload systemd ?

Jul 11 04:54:06 runbmc-nuvoton systemd[1]: Started Wait for 
/xyz/openbmc_project/led/groups/bmc_booted.

That is telling me that, it is waiting for the precondition to be met.. 
I thought you won't reach BMCReady state while having this stuck.  What 
is the "obmcutil state" saying ?.

Also, can you try "systemctl 
startobmc-led-group-start@bmc_booted.service" and see how it behaves.

If it's a one-off, I would suggest retry.. If this is persisting, open a 
girhub issue with needed information on  how to recreate.

!! Vishwa !!

On 7/16/19 9:20 AM, CS20 YSChu wrote:
>
> Hi Vishwa,
>
> -- The o/p of "systemctl status 
> obmc-led-group-start@bmc_booted.service 
> <mailto:obmc-led-group-start@bmc_booted.service>"
>
> obmc-led-group-start@bmc_booted.service - Assert bmc_booted LED
>
> Loaded: loaded (/lib/systemd/system/obmc-led-group-start@.service; 
> static; vendor preset: enabled)
>
> Drop-In: /lib/systemd/system/obmc-led-group-start@bmc_booted.service.d
>
> └─bmc_booted.conf
>
> Active: inactive (dead)
>
> Warning: The unit file, source configuration file or drop-ins of 
> obmc-led-group-start@bmc_booted.service changed on disk. Run 
> 'systemctl daemon-reload' to reload units.
>
> -- Properties of /xyz/openbmc_project/led/groups/bmc_booted
>
> array [
>
> dict entry(
>
> string "Asserted"
>
> variant             boolean false
>
> )
>
> ]
>
> -- properties of xyz/openbmc_project/led/physical/heartbeat ?
>
> array [
>
> dict entry(
>
> string "State"
>
> variant             string "xyz.openbmc_project.Led.Physical.Action.Off"
>
> )
>
> dict entry(
>
> string "DutyOn"
>
> variant             byte 50
>
> )
>
> dict entry(
>
> string "Color"
>
> variant             string 
> "xyz.openbmc_project.Led.Physical.Palette.Unknown"
>
> )
>
> dict entry(
>
> string "Period"
>
> variant             uint16 1000
>
> )
>
> ]
>
> Thanks.
>
> Stanley
>
> *From:*vishwa [mailto:vishwa@linux.vnet.ibm.com]
> *Sent:* Monday, July 15, 2019 5:48 PM
> *To:* CS20 YSChu; openbmc@lists.ozlabs.org
> *Subject:* Re: bmc_booted LED group was not asserted when BMC started up
>
> Hi Stanley,
>
> Could you tell:
>
> -- The o/p of "systemctl status 
> obmc-led-group-start@bmc_booted.service 
> <mailto:obmc-led-group-start@bmc_booted.service>"
>
> -- Properties of /xyz/openbmc_project/led/groups/bmc_booted
>
> -- properties of xyz/openbmc_project/led/physical/heartbeat ?
>
> !! Vishwa !!
>
> On 7/15/19 1:57 PM, CS20 YSChu wrote:
>
>     Hi,
>
>     In normal case, we will see bmc_booted LED group been asserted
>     when bmc starts up.
>
>     Apr 08 04:56:30 evb-npcm750 systemd[1]: Starting Wait for
>     /xyz/openbmc_project/led/groups/bmc_booted...
>
>     Apr 08 04:56:31 evb-npcm750 systemd[1]: Started Wait for
>     /xyz/openbmc_project/led/groups/bmc_booted.
>
>     Apr 08 04:56:35 evb-npcm750 systemd[1]: Starting Assert bmc_booted
>     LED...
>
>     Apr 08 04:56:35 evb-npcm750 systemd[1]: Started Assert bmc_booted LED.
>
>     Recently, I update to newer commit (don’t know what exact commit
>     cause this), the wanted service was started but
>     bmc-led-group-start service itself was not started. As a result,
>     bmc heartbeat led was not blinked.
>
>     Can anyone please advise how to investigate such kind of issue?
>
>     Jul 11 04:54:03 runbmc-nuvoton systemd[1]: Starting Wait for
>     /xyz/openbmc_project/led/groups/bmc_booted...
>
>     Jul 11 04:54:06 runbmc-nuvoton systemd[1]: Started Wait for
>     /xyz/openbmc_project/led/groups/bmc_booted.
>
>     ------
>
>     Below is unit file of obmc-led-group-start@bmc_booted.service
>     <mailto:obmc-led-group-start@bmc_booted.service> in
>     /lib/systemd/system/multi-user.target.wants
>
>     [Unit]
>
>     Description=Assert %i LED
>
>     Wants=mapper-wait@-xyz-openbmc_project-led-groups-%i.service
>     <mailto:Wants=mapper-wait@-xyz-openbmc_project-led-groups-%25i.service>
>
>     After=mapper-wait@-xyz-openbmc_project-led-groups-%i.service
>     <mailto:After=mapper-wait@-xyz-openbmc_project-led-groups-%25i.service>
>
>     Conflicts=obmc-led-group-stop@%i.service
>     <mailto:Conflicts=obmc-led-group-stop@%25i.service>
>
>     [Service]
>
>     Type=oneshot
>
>     RemainAfterExit=yes
>
>     Restart=no
>
>     ExecStart=/bin/sh -c "busctl call `mapper get-service
>     /xyz/openbmc_project/led/groups/%i`
>     /xyz/openbmc_project/led/groups/%i org.freedesktop.DBus.Properties
>     Set ssv xyz.openbmc_project.Led.Group Asserted b true"
>
>     SyslogIdentifier=obmc-led-group-start
>
>     Thanks.
>
>     Stanley
>
>     ------------------------------------------------------------------------
>
>     The privileged confidential information contained in this email is
>     intended for use only by the addressees as indicated by the
>     original sender of this email. If you are not the addressee
>     indicated in this email or are not responsible for delivery of the
>     email to such a person, please kindly reply to the sender
>     indicating this fact and delete all copies of it from your
>     computer and network server immediately. Your cooperation is
>     highly appreciated. It is advised that any unauthorized use of
>     confidential information of Nuvoton is strictly prohibited; and
>     any information in this email irrelevant to the official business
>     of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
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

--------------D02F697A50916BC39E744F41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hmm.,,</p>
    <p>Clearly, the systemd unit did not run / was not loaded
      successfully etc. Below line is telling me that some edits were
      done.<br>
    </p>
    <p><span style="color:#1F497D" lang="EN-US">Warning: The unit file,
        source configuration file or drop-ins of
        <a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a> changed on disk. Run
        'systemctl daemon-reload' to reload units.</span></p>
    <p><span style="color:#1F497D" lang="EN-US"><font color="#000000">Have
          you tried to reload systemd ?</font><br>
      </span></p>
    <p><span lang="EN-US">Jul 11 04:54:06 runbmc-nuvoton systemd[1]:
        Started Wait for /xyz/openbmc_project/led/groups/bmc_booted.</span></p>
    <p><span lang="EN-US">That is telling me that, it is waiting for the
        precondition to be met.. I thought you won't reach BMCReady
        state while having this stuck.  What is the "obmcutil state"
        saying ?.</span></p>
    <p><span lang="EN-US">Also, can you try "systemctl start</span><span
        lang="EN-US"> </span><span lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a>"
        and see how it behaves.</span></p>
    <p><span lang="EN-US">If it's a one-off, I would suggest retry.. If
        this is persisting, open a girhub issue with needed information
        on  how to recreate.</span></p>
    <p><span lang="EN-US">!! Vishwa !!</span></p>
    On 7/16/19 9:20 AM, CS20 YSChu wrote:<br>
    <blockquote type="cite"
cite="mid:HK2PR03MB4516A42C3DDE5528F5515D1CB6CE0@HK2PR03MB4516.apcprd03.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">Hi
            Vishwa,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><o:p> </o:p></span></p>
        <p><span lang="EN-US">-- The o/p of "systemctl status <a
              href="mailto:obmc-led-group-start@bmc_booted.service"
              moz-do-not-send="true">
              obmc-led-group-start@bmc_booted.service</a>"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a>
            - Assert bmc_booted LED<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            Loaded: loaded
            (/lib/systemd/system/obmc-led-group-start@.service; static;
            vendor preset: enabled)<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"> 
            Drop-In:
            /lib/systemd/system/obmc-led-group-start@bmc_booted.service.d<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">          
          </span><span
            style="font-family:&quot;新細明體&quot;,&quot;serif&quot;;color:#1F497D">└─</span><span
            style="color:#1F497D" lang="EN-US">bmc_booted.conf<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            Active: inactive (dead)<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">Warning:
            The unit file, source configuration file or drop-ins of
            <a class="moz-txt-link-abbreviated" href="mailto:obmc-led-group-start@bmc_booted.service">obmc-led-group-start@bmc_booted.service</a> changed on disk. Run
            'systemctl daemon-reload' to reload units.<o:p></o:p></span></p>
        <p><span lang="EN-US">-- Properties of
            /xyz/openbmc_project/led/groups/bmc_booted<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            array [<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            dict entry(<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            string "Asserted"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            variant             boolean false<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            )<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            ]<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><o:p> </o:p></span></p>
        <p><span lang="EN-US">-- properties of
            xyz/openbmc_project/led/physical/heartbeat ?<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            array [<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            dict entry(<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            string "State"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            variant             string
            "xyz.openbmc_project.Led.Physical.Action.Off"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            )<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            dict entry(<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            string "DutyOn"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            variant             byte 50<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            )<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            dict entry(<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            string "Color"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            variant             string
            "xyz.openbmc_project.Led.Physical.Palette.Unknown"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            )<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            dict entry(<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            string "Period"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">        
            variant             uint16 1000<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">     
            )<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">  
            ]<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><o:p> </o:p></span></p>
        <div>
          <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">Thanks.<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US">Stanley<o:p></o:p></span></p>
        </div>
        <p class="MsoNormal"><span style="color:#1F497D" lang="EN-US"><o:p> </o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #B5C4DF
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext"
                  lang="EN-US">From:</span></b><span
style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext"
                lang="EN-US"> vishwa [<a class="moz-txt-link-freetext" href="mailto:vishwa@linux.vnet.ibm.com">mailto:vishwa@linux.vnet.ibm.com</a>]
                <br>
                <b>Sent:</b> Monday, July 15, 2019 5:48 PM<br>
                <b>To:</b> CS20 YSChu; <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
                <b>Subject:</b> Re: bmc_booted LED group was not
                asserted when BMC started up<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p><span lang="EN-US">Hi Stanley,<o:p></o:p></span></p>
        <p><span lang="EN-US">Could you tell:<o:p></o:p></span></p>
        <p><span lang="EN-US">-- The o/p of "systemctl status <a
              href="mailto:obmc-led-group-start@bmc_booted.service"
              moz-do-not-send="true">
              obmc-led-group-start@bmc_booted.service</a>"<o:p></o:p></span></p>
        <p><span lang="EN-US">-- Properties of
            /xyz/openbmc_project/led/groups/bmc_booted<o:p></o:p></span></p>
        <p><span lang="EN-US">-- properties of
            xyz/openbmc_project/led/physical/heartbeat ?<o:p></o:p></span></p>
        <p><span lang="EN-US">!! Vishwa !!<o:p></o:p></span></p>
        <div>
          <p class="MsoNormal"><span lang="EN-US">On 7/15/19 1:57 PM,
              CS20 YSChu wrote:<o:p></o:p></span></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p class="MsoNormal"><span lang="EN-US">Hi,<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">In normal case, we
              will see bmc_booted LED group been asserted when bmc
              starts up.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
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
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Recently, I update to
              newer commit (don’t know what exact commit cause this),
              the wanted service was started but bmc-led-group-start
              service itself was not started. As a result, bmc heartbeat
              led was not blinked.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Can anyone please
              advise how to investigate such kind of issue?<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Jul 11 04:54:03
              runbmc-nuvoton systemd[1]: Starting Wait for
              /xyz/openbmc_project/led/groups/bmc_booted...<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Jul 11 04:54:06
              runbmc-nuvoton systemd[1]: Started Wait for
              /xyz/openbmc_project/led/groups/bmc_booted.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">------<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Below is unit file of
              <a href="mailto:obmc-led-group-start@bmc_booted.service"
                moz-do-not-send="true">
                obmc-led-group-start@bmc_booted.service</a> in
              /lib/systemd/system/multi-user.target.wants<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">[Unit]<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Description=Assert %i
              LED<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"><a
href="mailto:Wants=mapper-wait@-xyz-openbmc_project-led-groups-%25i.service"
                moz-do-not-send="true">Wants=mapper-wait@-xyz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"><a
href="mailto:After=mapper-wait@-xyz-openbmc_project-led-groups-%25i.service"
                moz-do-not-send="true">After=mapper-wait@-xyz-openbmc_project-led-groups-%i.service</a><o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"><a
                href="mailto:Conflicts=obmc-led-group-stop@%25i.service"
                moz-do-not-send="true">Conflicts=obmc-led-group-stop@%i.service</a><o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
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
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Thanks.<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US">Stanley<o:p></o:p></span></p>
          <p class="MsoNormal"><span lang="EN-US"> <o:p></o:p></span></p>
          <div class="MsoNormal" style="text-align:center"
            align="center"><span style="font-family:&quot;Times New
              Roman&quot;,&quot;serif&quot;" lang="EN-US">
              <hr width="100%" size="3" align="center">
            </span></div>
          <p class="MsoNormal"><span
              style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:gray"
              lang="EN-US">The privileged confidential information
              contained in this email is intended for use only by the
              addressees as indicated by the original sender of this
              email. If you are not the addressee indicated in this
              email or are not responsible for delivery of the email to
              such a person, please kindly reply to the sender
              indicating this fact and delete all copies of it from your
              computer and network server immediately. Your cooperation
              is highly appreciated. It is advised that any unauthorized
              use of confidential information of Nuvoton is strictly
              prohibited; and any information in this email irrelevant
              to the official business of Nuvoton shall be deemed as
              neither given nor endorsed by Nuvoton. </span><span
              style="font-family:&quot;Times New
              Roman&quot;,&quot;serif&quot;" lang="EN-US"><o:p></o:p></span></p>
        </blockquote>
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

--------------D02F697A50916BC39E744F41--

