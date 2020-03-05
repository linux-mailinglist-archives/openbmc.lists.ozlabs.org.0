Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AF17A0C0
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 08:59:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y36k2pZgzDqrF
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 18:59:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=lkammath@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y35v2bX6zDqgN
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 18:58:25 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0257trTY127434
 for <openbmc@lists.ozlabs.org>; Thu, 5 Mar 2020 02:58:23 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj3et1bqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2020 02:58:19 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Thu, 5 Mar 2020 07:57:28 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 5 Mar 2020 07:57:25 -0000
Received: from us1b3-mail34.a3dr.sjc01.isc4sb.com ([10.122.7.220])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020030507572567-147613 ;
 Thu, 5 Mar 2020 07:57:25 +0000 
In-Reply-To: <c2ebd229-edfc-4e9c-877e-313bce3a8c3e@www.fastmail.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: andrew@aj.id.au
Date: Thu, 5 Mar 2020 07:57:24 +0000
Sensitivity: 
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-KeepSent: 52780FFD:4F5D715D-00258522:002B956C;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 12283
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20030507-1429-0000-0000-000001865202
X-IBM-SpamModules-Scores: BY=0.294056; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.062930
X-IBM-SpamModules-Versions: BY=3.00012690; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01343179; UDB=6.00715996; IPR=6.01125569; 
 MB=3.00031089; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-05 07:57:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-05 06:23:34 - 6.00011080
x-cbparentid: 20030507-1430-0000-0000-00009B6D7D1B
Message-Id: <OF52780FFD.4F5D715D-ON00258522.002B956C-00258522.002BB560@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [OpenBMC]: Unit test coverage analysis on openbmc repositories
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_01:2020-03-04,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><div>Hi Al=
l,</div>
<div>&nbsp;</div>
<div>please confirm on following</div>
<div><br>Boost-bus - compilation fails . Is it used? Should be archived @an=
drewj?</div>
<div>&nbsp;</div>
<div>Google-ipmi-i2c - code compiles well, complain in formatting script @<=
span><a data-hovercard-type=3D"user" data-hovercard-url=3D"/users/pstrinkle=
/hovercard" href=3D"https://github.com/pstrinkle" target=3D"_blank">pstrink=
le</a></span><br>subsys_initcall(i2c_via_ipmi_init);^[[m^M<br>Traceback (mo=
st recent call last):^M<br>&nbsp; File "/home/lkammath/final_data/unit-test=
.py", line 826, in &lt;module&gt;^M<br>&nbsp;&nbsp;&nbsp; check_call_cmd(".=
/format-code.sh", CODE_SCAN_DIR)^M<br>&nbsp; File "/home/lkammath/final_dat=
a/unit-test.py", line 229, in check_call_cmd^M<br>&nbsp;&nbsp;&nbsp; check_=
call(cmd)^M<br>&nbsp; File "/usr/lib/python2.7/subprocess.py", line 190, in=
 check_call^M<br>&nbsp;&nbsp;&nbsp; raise CalledProcessError(retcode, cmd)^=
M<br>subprocess.CalledProcessError: Command '('./format-code.sh', '/home/lk=
ammath/final_data/google-ipmi-i2c')' returned non-zero exit status 1^M<br>T=
raceback (most recent call last):^M<br>&nbsp; File "/home/lkammath/final_da=
ta/dbus-unit-test.py", line 91, in &lt;module&gt;^M</div>
<div><br>Inarp.git - Should be archived @andrewj?<br>Compilation issue<br>i=
narp.c: In function =E2=80=98arp_recv=E2=80=99:<br>inarp.c:433:4: error: ta=
king address of packed member of =E2=80=98struct arp_packet=E2=80=99 may re=
sult in an unaligned pointer value [-Werror=3Daddress-of-packed-member]<br>=
&nbsp; 433 |&nbsp;&nbsp;&nbsp; &amp;inarp_req.src_ip);<br>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~<br>In function =E2=80=
=98do_ifreq=E2=80=99,<br>&nbsp;&nbsp;&nbsp; inlined from =E2=80=98get_local=
_ipaddr=E2=80=99 at inarp.c:182:7,<br>&nbsp;&nbsp;&nbsp; inlined from =E2=
=80=98arp_recv=E2=80=99 at inarp.c:419:7,<br>&nbsp;&nbsp;&nbsp; inlined fro=
m =E2=80=98main=E2=80=99 at inarp.c:480:4:<br>inarp.c:170:2: error: =E2=80=
=98strncpy=E2=80=99 output may be truncated copying 16 bytes from a string =
of length 16 [-Werror=3Dstringop-truncation]<br>&nbsp; 170 |&nbsp; strncpy(=
ifreq-&gt;ifr_name, ifname, sizeof(ifreq-&gt;ifr_name));<br>&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~<br>cc1: all warnings being treated as errors<br>make[1]: *** [inarp.=
o] Error 1<br>make[1]: Leaving directory `/esw/san5/lkammath/boost/inarp'<b=
r>make: *** [all] Error 2</div>
<div>In CI environment<br>ool.la -lncurses -ltinfo&nbsp; -lcrypto^M<br>copy=
ing selected object files to avoid basename conflicts...^M<br>ar: `u' modif=
ier ignored since `D' is the default (see `U')^M<br>make[4]: Leaving direct=
ory '/home/lkammath/final_data/ipmitool/src/plugins/lan'^M<br>Making all in=
 lanplus^M<br>make[4]: Entering directory '/home/lkammath/final_data/ipmito=
ol/src/plugins/lanplus'^M<br>/bin/bash ../../../libtool --silent&nbsp; --ta=
g=3DCC&nbsp;&nbsp; --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I../../.. -I..=
/../../include&nbsp;&nbsp;&nbsp; -g -O2 -Wall -Wextra -std=3Dc99 -pedantic =
-Wformat -Wformat-nonliteral -MT lanplus_crypt_impl.lo -MD -MP -MF .deps/la=
nplus_crypt_impl.Tpo -c -o lanplus_crypt_impl.lo lanplus_crypt_impl.c^M<br>=
lanplus_crypt_impl.c: In function 'lanplus_encrypt_aes_cbc_128':^M<br>lanpl=
us_crypt_impl.c:158:17: error: storage size of 'ctx' isn't known^M<br>&nbsp=
; 158 |&nbsp; EVP_CIPHER_CTX ctx;^M<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ^~~^M<br>lanplus_crypt_impl.c:158:17: warning: unused var=
iable 'ctx' [-Wunused-variable]^M<br>lanplus_crypt_impl.c: In function 'lan=
plus_decrypt_aes_cbc_128':^M<br>lanplus_crypt_impl.c:233:17: error: storage=
 size of 'ctx' isn't known^M<br>&nbsp; 233 |&nbsp; EVP_CIPHER_CTX ctx;^M<br=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~^M</div>
<div><br>Smbios-mdr - @brad. Please confirm if used?<br>No automake env (ma=
ke)</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, s=
ans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Arial, Hel=
vetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thanks &=
amp; Regards,<br>Lakshminarayana Kamath<br>--------------------------------=
------------------------------------------------------------------</div></d=
iv></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Andrew Jeffery" &=
lt;andrew@aj.id.au&gt;<br>To: "Lakshminarayana R Kammath" &lt;lkammath@in.i=
bm.com&gt;, openbmc@lists.ozlabs.org<br>Cc:<br>Subject: [EXTERNAL] Re: [Ope=
nBMC]: Unit test coverage analysis on openbmc repositories<br>Date: Tue, Ma=
r 3, 2020 10:18 AM<br>&nbsp;
<div><br><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,mon=
ospace" >On Sat, 29 Feb 2020, at 02:05, Lakshminarayana R Kammath wrote:<br=
><br>&gt; <a href=3D"https://github.com/openbmc/obmc-console.git" target=3D=
"_blank">https://github.com/openbmc/obmc-console.git</a>&nbsp;&nbsp;YES, UN=
IT TEST<br><br>I need to add coverage support to obmc-console.<br><br>&gt; =
<a href=3D"https://github.com/openbmc/openbmc-tools.git" target=3D"_blank">=
https://github.com/openbmc/openbmc-tools.git</a>&nbsp;&nbsp;NO<br><br>Not s=
ure we can expect anything for openbmc-tools - it's a collection<br>of rand=
om scripts people have written to make their life developing<br>openbmc eas=
ier. It's not something that should have strict QA<br>processes.<br><br>&gt=
; <a href=3D"https://github.com/openbmc/openpower-host-ipmi-flash.git" targ=
et=3D"_blank">https://github.com/openbmc/openpower-host-ipmi-flash.git</a>&=
nbsp;&nbsp;NO<br><br>I should add some tests here where I can.<br><br>&gt; =
<a href=3D"https://github.com/openbmc/hiomapd.git" target=3D"_blank">https:=
//github.com/openbmc/hiomapd.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a h=
ref=3D"https://github.com/openbmc/libmctp.git" target=3D"_blank">https://gi=
thub.com/openbmc/libmctp.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=
=3D"https://github.com/openbmc/phosphor-led-sysfs.git" target=3D"_blank">ht=
tps://github.com/openbmc/phosphor-led-sysfs.git</a>&nbsp;&nbsp;YES, UNIT TE=
ST<br><br>These three do in-fact have GCOV/LCOV support, you need to do the=
 usual autotools invocations to get it:<br><br>```<br>./configure --enable-=
code-coverage &amp;&amp; make check-code-coverage<br>```<br><br>&gt; <a hre=
f=3D"https://github.com/openbmc/phosphor-mboxd.git" target=3D"_blank">https=
://github.com/openbmc/phosphor-mboxd.git</a>&nbsp;&nbsp;ERROR<br><br>This i=
s archived.<br><br>...<br><br>&gt; <a href=3D"https://github.com/openbmc/u-=
boot" target=3D"_blank">https://github.com/openbmc/u-boot</a>&nbsp;&nbsp;NO=
<br><br>This uses Kbuild as a build system. I notice openbmc/linux and open=
bmc/qemu aren't included in the list.<br><br>&gt; <a href=3D"https://github=
.com/openbmc/webui-vue.git" target=3D"_blank">https://github.com/openbmc/we=
bui-vue.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc=
/witherspoon-pfault-analysis.git" target=3D"_blank">https://github.com/open=
bmc/witherspoon-pfault-analysis.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a=
 href=3D"https://github.com/openbmc/x86-power-control.git" target=3D"_blank=
">https://github.com/openbmc/x86-power-control.git</a>&nbsp;&nbsp;NO<br>&gt=
; *************************UNIT TEST COVERAGE<br>&gt; REPORT***************=
**********<br>&gt; SUMMARY:<br>&gt; TOTAL REPOSITORIES : 110<br>&gt; TESTED=
 REPOSITORIES : 43<br>&gt; ERROR : 11<br>&gt; COVERAGE REPORT : 12<br>&gt; =
UNIT TEST REPORT : 31<br>&gt; NO REPORT : 56<br>&gt; **********************=
*****************************************************<br>&gt; Following act=
ions, we can draw from above<br>&gt;<br>&gt; &nbsp;1. *There are 12 repo's =
that have GCOV/LCOV plugged in* - We need to<br>&gt; maintain which has goo=
d coverage and try to improve those which has<br>&gt; less coverage<br>&gt;=
 &nbsp;2. *There are 31 repo's that have unit test cases added but no<br>&g=
t; coverage analysis because they aren't plugged in yet to GCOV/LCOV* - Is<=
br>&gt; there a plan for plugging in GCOV<br><br>As above at least three of=
 these are false-negatives for test coverage.<br><br>Andrew</font><br>&nbsp=
;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>

