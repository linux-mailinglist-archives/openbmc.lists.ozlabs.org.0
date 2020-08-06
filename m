Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E723DA7B
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 14:54:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpNp2kCTzDqFG
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 22:54:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kw15Z/Mz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMp6G2JS0zDqnw
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 22:42:13 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076CW7ti032256
 for <openbmc@lists.ozlabs.org>; Thu, 6 Aug 2020 08:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : to : cc :
 from : date : references : content-type : message-id : mime-version :
 subject; s=pp1; bh=xvkGT25XWKxY0wC8CbFx7cbHxEFEKhLpKp9oIMVO9B4=;
 b=kw15Z/MzekXfCVAHzPINAq/mayJLHy1npvMO16fciFazGBWXDBzFC3Lts/rKeORDp/xW
 Ypkmfe+xICXYmBf4fWBpm17LqzDvghMqy6OpiwjkBnDkb2lRc00oaIiBLRQIP4yvYBR5
 06l6kX/DCzifDNTFmKAEdbAP8DBWXzFGBkYnl0EPtRa/1sh9KZEeHTBUQ1f6E8GbUYer
 6nP3mj50jCYcslXGjqR46YJcw4oVMTkO5v1zFbk7J/19+21CJfJGU+xYGUrHUpMjtCTF
 tuTjbOTyPWd/UtHfq8Hin8BvS4kdRy3Qf0tTqkR+xBNTFm+u/34/fbAMfDt/ym2Agap4 AA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rfm94khc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Aug 2020 08:42:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 6 Aug 2020 12:42:10 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 6 Aug 2020 12:42:09 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020080612420823-357830 ;
 Thu, 6 Aug 2020 12:42:08 +0000 
In-Reply-To: <SG2PR04MB3093C5E6BF183CAEC4D5900EE1480@SG2PR04MB3093.apcprd04.prod.outlook.com>
To: Jayashree D <jayashree-d@hcl.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 6 Aug 2020 18:12:04 +0530
References: <SG2PR04MB3093C5E6BF183CAEC4D5900EE1480@SG2PR04MB3093.apcprd04.prod.outlook.com>
X-KeepSent: 45B9D556:E7F052F0-002585BC:00454908;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 12755
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98"
x-cbid: 20080612-9463-0000-0000-000003D72308
X-IBM-SpamModules-Scores: BY=0.294048; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.391525; ST=0; TS=0; UL=0; ISC=; MB=0.138287
X-IBM-SpamModules-Versions: BY=3.00013598; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01416413; UDB=6.00759540; IPR=6.01198830; 
 MB=3.00033389; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-06 12:42:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-06 12:34:56 - 6.00011691
x-cbparentid: 20080612-9464-0000-0000-00004CB523F8
Message-Id: <OF45B9D556.E7F052F0-ON002585BC.00454908-652585BC.0045C50D@notes.na.collabserv.com>
MIME-Version: 1.0
Subject: Re:  Host related testcases in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98"


--1__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Jayashree,

	See if this info helps to get you started what you are looking for.

1. OBMC-CONSOLE - To connect the host via BMC, we are using
obmc-console-client to login the host and check the host conections.

Most of the test code uses the login  BMC/host, check connect via
REST/SSH/Ping to do the check on connection

You can look at this keyword used:
Example:

  -login to BMC and execute :   BMC Execute Command

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/bmc=5Fss=
h=5Futils.py#L12

https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/exte=
nded/test=5Fbasic=5Fci.robot#L74

https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/exte=
nded/test=5Fbasic=5Fci.robot#L96

https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/mana=
gers/test=5Fcertificate.robot#L413
  etc...

  or simply use something like this:
    SSHLibrary.Open connection  ${bmc=5Fip}
    SSHLibrary.Login  ${openbmc=5Fusername}  ${openbmc=5Fpassword}

  -login to Host and execute: Login To OS Host   /  OS Execute Command

https://github.com/openbmc/openbmc-test-automation/blob/master/syslib/utils=
=5Fos.robot#L38

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/bmc=5Fss=
h=5Futils.py#L70

  etc.

  - obmc-console-client: Start SOL Console Logging / Stop SOL Console
Logging

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/common=
=5Futils.robot#L386

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/common=
=5Futils.robot#L342

  you can grep/serach around tests / redfish dir, you ll see where and how
they are used in the test suite


The test boot keywords to power on /off/ reboot etc are here,
https://github.com/openbmc/openbmc-test-automation/blob/master/lib/boot=5Fu=
tils.robot

you'll notice those are used in test to drive the boot and the best part is
if you key in these test parameter from robot command line
https://github.com/openbmc/openbmc-test-automation/blob/master/lib/resource=
.robot#L45


it will ensure, to login and check if the Host is up and running as part of
the boot keyword



2. HOST LOGGER - To handle and store host's console output data, such as
boot logs.

  You can use the above SOL keyword to collect the data for Host boot logs
  You can as well use IPMI SOL capabilities

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/ipmi=5Fc=
lient.robot#L188

https://github.com/openbmc/openbmc-test-automation/blob/master/lib/ipmi=5Fc=
lient.robot#L204

  FFDC collects those data as well :
https://github.com/openbmc/openbmc-test-automation/blob/master/lib/openbmc=
=5Fffdc.robot#L39





Thanks and Regards,
   George Keishing





From:	Jayashree D <jayashree-d@hcl.com>
To:	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date:	06-08-2020 04:08 PM
Subject:	[EXTERNAL] Host related testcases in openbmc-test-automation
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>



Hi All,

I need to test the below features in openbmc-test-automation.
Is there any related testcases to verify those features?

1. OBMC-CONSOLE - To connect the host via BMC, we are using
obmc-console-client to login the host and check the host conections.
   (https://github.com/openbmc/obmc-console)

2. HOST LOGGER - To handle and store host's console output data, such as
boot logs.
   (https://github.com/openbmc/phosphor-hostlogger)


Regards,
Jayashree



::DISCLAIMER::
The contents of this e-mail and any attachment(s) are confidential and
intended for the named recipient(s) only. E-mail transmission is not
guaranteed to be secure or error-free as information could be intercepted,
corrupted, lost, destroyed, arrive late or incomplete, or may contain
viruses in transmission. The e mail and its contents (with or without
referred errors) shall therefore not attach any liability on the originator
or HCL or its affiliates. Views or opinions, if any, presented in this
email are solely those of the author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction,
dissemination, copying, disclosure, modification, distribution and / or
publication of this message without the prior written consent of authorized
representative of HCL is strictly prohibited. If you have received this
email in error please delete it and notify the sender immediately. Before
opening any email and/or attachments, please check them for viruses and
other defects.







--1__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten

<html><body><p><font size=3D"2">Jayashree,</font><br><br><font size=3D"2"> =
       See if this info helps to get you started what you are looking for. =
</font><br><br><b><font size=3D"2">1. OBMC-CONSOLE - To connect the host vi=
a BMC, we are using obmc-console-client to login the host and check the hos=
t conections.</font></b><br><br><font size=3D"2">Most of the test code uses=
 the login  BMC/host, check connect via REST/SSH/Ping to do the check on co=
nnection</font><br><br><font size=3D"2">You can look at this keyword used:<=
/font><br><font size=3D"2">Example:</font><br><br><font size=3D"2">  -login=
 to BMC and execute :   BMC Execute Command</font><br><font size=3D"2">  </=
font><a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/mas=
ter/lib/bmc_ssh_utils.py#L12"><font size=3D"2">https://github.com/openbmc/o=
penbmc-test-automation/blob/master/lib/bmc_ssh_utils.py#L12</font></a><br><=
font size=3D"2">  </font><a href=3D"https://github.com/openbmc/openbmc-test=
-automation/blob/master/redfish/extended/test_basic_ci.robot#L74"><font siz=
e=3D"2">https://github.com/openbmc/openbmc-test-automation/blob/master/redf=
ish/extended/test_basic_ci.robot#L74</font></a><br><font size=3D"2">  </fon=
t><a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/master=
/redfish/extended/test_basic_ci.robot#L96"><font size=3D"2">https://github.=
com/openbmc/openbmc-test-automation/blob/master/redfish/extended/test_basic=
_ci.robot#L96</font></a><br><font size=3D"2">  </font><a href=3D"https://gi=
thub.com/openbmc/openbmc-test-automation/blob/master/redfish/managers/test_=
certificate.robot#L413"><font size=3D"2">https://github.com/openbmc/openbmc=
-test-automation/blob/master/redfish/managers/test_certificate.robot#L413</=
font></a><br><font size=3D"2">  etc...</font><br><font size=3D"2">  </font>=
<br><font size=3D"2">  or simply use something like this:</font><br><font s=
ize=3D"2">    SSHLibrary.Open connection  ${bmc_ip}</font><br><font size=3D=
"2">    SSHLibrary.Login  ${openbmc_username}  ${openbmc_password}</font><b=
r><font size=3D"2">  </font><br><font size=3D"2">  -login to Host and execu=
te: Login To OS Host   /  OS Execute Command</font><br><font size=3D"2">  <=
/font><a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/ma=
ster/syslib/utils_os.robot#L38"><font size=3D"2">https://github.com/openbmc=
/openbmc-test-automation/blob/master/syslib/utils_os.robot#L38</font></a><b=
r><font size=3D"2">  </font><a href=3D"https://github.com/openbmc/openbmc-t=
est-automation/blob/master/lib/bmc_ssh_utils.py#L70"><font size=3D"2">https=
://github.com/openbmc/openbmc-test-automation/blob/master/lib/bmc_ssh_utils=
.py#L70</font></a><font size=3D"2">  </font><br><font size=3D"2">  etc. </f=
ont><br><font size=3D"2">  </font><br><font size=3D"2">  - obmc-console-cli=
ent: Start SOL Console Logging / Stop SOL Console Logging</font><br><font s=
ize=3D"2">  </font><a href=3D"https://github.com/openbmc/openbmc-test-autom=
ation/blob/master/lib/common_utils.robot#L386"><font size=3D"2">https://git=
hub.com/openbmc/openbmc-test-automation/blob/master/lib/common_utils.robot#=
L386</font></a><br><font size=3D"2">  </font><a href=3D"https://github.com/=
openbmc/openbmc-test-automation/blob/master/lib/common_utils.robot#L342"><f=
ont size=3D"2">https://github.com/openbmc/openbmc-test-automation/blob/mast=
er/lib/common_utils.robot#L342</font></a><br><font size=3D"2">  </font><br>=
<font size=3D"2">  you can grep/serach around tests / redfish dir, you ll s=
ee where and how they are used in the test suite  </font><br><br><br><font =
size=3D"2">The test boot keywords to power on /off/ reboot etc are here, </=
font><a href=3D"https://github.com/openbmc/openbmc-test-automation/blob/mas=
ter/lib/boot_utils.robot"><u><font color=3D"#0000FF">https://github.com/ope=
nbmc/openbmc-test-automation/blob/master/lib/boot_utils.robot</font></u></a=
> <br><font size=3D"2">you'll notice those are used in test to drive the bo=
ot and the best part is  if you key in these test parameter from robot comm=
and line </font><a href=3D"https://github.com/openbmc/openbmc-test-automati=
on/blob/master/lib/resource.robot#L45"><u><font color=3D"#0000FF">https://g=
ithub.com/openbmc/openbmc-test-automation/blob/master/lib/resource.robot#L4=
5</font></u></a> <br><br>it will ensure, to login and check if the Host is =
up and running as part of the boot keyword<br><br><font size=3D"2">   </fon=
t><br><br><b><font size=3D"2">2. HOST LOGGER - To handle and store host's c=
onsole output data, such as boot logs.</font></b><br><br><font size=3D"2"> =
 You can use the above SOL keyword to collect the data for Host boot logs <=
/font><br><font size=3D"2">  You can as well use IPMI SOL capabilities </fo=
nt><br><font size=3D"2">  </font><a href=3D"https://github.com/openbmc/open=
bmc-test-automation/blob/master/lib/ipmi_client.robot#L188"><font size=3D"2=
">https://github.com/openbmc/openbmc-test-automation/blob/master/lib/ipmi_c=
lient.robot#L188</font></a><br><font size=3D"2">  </font><a href=3D"https:/=
/github.com/openbmc/openbmc-test-automation/blob/master/lib/ipmi_client.rob=
ot#L204"><font size=3D"2">https://github.com/openbmc/openbmc-test-automatio=
n/blob/master/lib/ipmi_client.robot#L204</font></a><br><br><font size=3D"2"=
>  FFDC collects those data as well : </font><a href=3D"https://github.com/=
openbmc/openbmc-test-automation/blob/master/lib/openbmc_ffdc.robot#L39"><fo=
nt size=3D"2">https://github.com/openbmc/openbmc-test-automation/blob/maste=
r/lib/openbmc_ffdc.robot#L39</font></a><br><br><font size=3D"2"> </font><br=
><br><br><br><b><font size=3D"2" color=3D"#0000FF">Thanks and Regards,</fon=
t></b><br><font size=3D"2" color=3D"#0000FF">   George Keishing</font><br><=
font size=3D"2" color=3D"#0000FF">   </font><br><br><br><img width=3D"16" h=
eight=3D"16" src=3D"cid:1__=3D8FBB0F2FDFD6CF988f9e8a93df938690918c8FB@" bor=
der=3D"0" alt=3D"Inactive hide details for Jayashree D ---06-08-2020 04:08:=
09 PM---Hi All, I need to test the below features in openbmc-test-aut"><fon=
t size=3D"2" color=3D"#424282">Jayashree D ---06-08-2020 04:08:09 PM---Hi A=
ll, I need to test the below features in openbmc-test-automation.</font><br=
><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2=
">Jayashree D &lt;jayashree-d@hcl.com&gt;</font><br><font size=3D"2" color=
=3D"#5F5F5F">To:        </font><font size=3D"2">&quot;openbmc@lists.ozlabs.=
org&quot; &lt;openbmc@lists.ozlabs.org&gt;</font><br><font size=3D"2" color=
=3D"#5F5F5F">Date:        </font><font size=3D"2">06-08-2020 04:08 PM</font=
><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=
=3D"2">[EXTERNAL] Host related testcases in openbmc-test-automation</font><=
br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"=
2">&quot;openbmc&quot; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozla=
bs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade s=
tyle=3D"color:#8091A5; "><br><br><br><font face=3D"Calibri">Hi All,</font><=
br><font face=3D"Calibri"> </font><br><font face=3D"Calibri">I need to test=
 the below features in openbmc-test-automation.</font><br><font face=3D"Cal=
ibri">Is there any related testcases to verify those features?</font><br><f=
ont face=3D"Calibri"> </font><br><font face=3D"Calibri">1. OBMC-CONSOLE - T=
o connect the host via BMC, we are using obmc-console-client to login the h=
ost and check the host conections.</font><br><font face=3D"Calibri">   (</f=
ont><a href=3D"https://github.com/openbmc/obmc-console"><u><font color=3D"#=
0563C1" face=3D"Calibri">https://github.com/openbmc/obmc-console</font></u>=
</a><font face=3D"Calibri">)</font><br><font face=3D"Calibri">   </font><br=
><font face=3D"Calibri">2. HOST LOGGER - To handle and store host's console=
 output data, such as boot logs.</font><br><font face=3D"Calibri">   (</fon=
t><a href=3D"https://github.com/openbmc/phosphor-hostlogger"><u><font color=
=3D"#0563C1" face=3D"Calibri">https://github.com/openbmc/phosphor-hostlogge=
r</font></u></a><font face=3D"Calibri">)</font><br><font face=3D"Calibri"> =
</font><br><font face=3D"Calibri"> </font><br><font face=3D"Calibri">Regard=
s,</font><br><font face=3D"Calibri">Jayashree</font><br><font face=3D"Calib=
ri"> </font><p><font size=3D"1" color=3D"#808080" face=3D"Arial">::DISCLAIM=
ER::<br></font><hr width=3D"100%" size=3D"2" align=3D"left"><font size=3D"1=
" color=3D"#808080" face=3D"Arial">The contents of this e-mail and any atta=
chment(s) are confidential and intended for the named recipient(s) only. E-=
mail transmission is not guaranteed to be secure or error-free as informati=
on could be intercepted, corrupted, lost, destroyed, arrive late or incompl=
ete, or may contain viruses in transmission. The e mail and its contents (w=
ith or without referred errors) shall therefore not attach any liability on=
 the originator or HCL or its affiliates. Views or opinions, if any, presen=
ted in this email are solely those of the author and may not necessarily re=
flect the views or opinions of HCL or its affiliates. Any form of reproduct=
ion, dissemination, copying, disclosure, modification, distribution and / o=
r publication of this message without the prior written consent of authoriz=
ed representative of HCL is strictly prohibited. If you have received this =
email in error please delete it and notify the sender immediately. Before o=
pening any email and/or attachments, please check them for viruses and othe=
r defects.<br></font><hr width=3D"100%" size=3D"2" align=3D"left"><p><p><BR>
</body></html>

--1__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98--


--0__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0F2FDFD6CF988f9e8a93df938690918c8FBB0F2FDFD6CF98--

