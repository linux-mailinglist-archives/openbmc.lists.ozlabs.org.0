Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5B1EF542
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 12:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49df0M3vMHzDqvD
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 20:24:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=prkatti1@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ddzJ3gBbzDqvK
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 20:23:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 055A3Aod190037
 for <openbmc@lists.ozlabs.org>; Fri, 5 Jun 2020 06:23:52 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31f9dbsdsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jun 2020 06:23:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <prkatti1@in.ibm.com>;
 Fri, 5 Jun 2020 10:23:51 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 5 Jun 2020 10:23:49 -0000
Received: from us1a3-mail267.a3.dal06.isc4sb.com ([10.146.127.216])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020060510234907-316667 ;
 Fri, 5 Jun 2020 10:23:49 +0000 
In-Reply-To: <OF1080F77B.8EF587E4-ON0025857E.003665AE-6525857E.00366D57@LocalDomain>
To: krtaylor <kurt.r.taylor@gmail.com>, openbmc@lists.ozlabs.org
From: "Prashanth Katti1" <prkatti1@in.ibm.com>
Date: Fri, 5 Jun 2020 15:53:48 +0530
References: <OF1080F77B.8EF587E4-ON0025857E.003665AE-6525857E.00366D57@LocalDomain>
X-KeepSent: F1020D53:5F22D36A-0025857E:00374E05;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 17435
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 00391A396525857E_="
x-cbid: 20060510-8889-0000-0000-000002D9A33A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013230; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01387076; UDB=6.00742003; IPR=6.01169342; 
 MB=3.00032477; MTD=3.00000008; XFM=3.00000015; UTC=2020-06-05 10:23:51
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-06-05 10:19:38 - 6.00011447
x-cbparentid: 20060510-8890-0000-0000-0000667A2D81
Message-Id: <OFF1020D53.5F22D36A-ON0025857E.00374E05-6525857E.00391C68@notes.na.collabserv.com>
MIME-Version: 1.0
Subject: RE: OpenBMC 2.8 Release
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_02:2020-06-04,
 2020-06-05 signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=_alternative 00391A396525857E_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi All,
We tested Firmware version : 2.8.0-rc1-0-g35a774200 on Witherspoon, and=20
found following issues.

DHCP                    - https://github.com/openbmc/bmcweb/issues/127
LDAP                     -=20
https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html
VLAN via REST - https://github.com/openbmc/openbmc/issues/3668
VLAN via IPMI     -=20
https://github.com/openbmc/phosphor-net-ipmid/issues/12

Rest of the functionalities looks good and are stable in our testing.
Hope this input helps.

Prashanth Katti




From:   krtaylor <kurt.r.taylor@gmail.com>
To:     OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   03-06-2020 00:46
Subject:        [EXTERNAL] Re: OpenBMC 2.8 Release
Sent by:        "openbmc"=20
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>



On 5/4/20 1:29 AM, Deepak Kodihalli wrote:
> On 04/05/20 10:43 am, Andrew Jeffery wrote:
>>
>>
>> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
>>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>>>> just add it directly here:
>>>>=20
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fope=
nbmc=5Fopenbmc=5Fwiki=5FCurrent-2DRelease-2DContent&d=3DDwIDaQ&c=3Djf=5FiaS=
HvJObTbx-siA1ZOg&r=3DhHlxml=5FLX5HIffRsSFs-k3DrxQDKe6i0A3XGNW7rlIw&m=3DkawJ=
xYAUDgnBEzwq08eGCJz6bv-YZv=5FH6QkLZavbRYw&s=3DnwFvaArvxP3BE4HNXG78g9M1NdfDY=
g-mzFTpR4M8ExE&e=3D=20

>>> Added:
>>>   * Yocto refresh to "Dunfell" version 3.1
>>>   * Redfish support for: full certificate management, complete LDAP
>>> management, full sensor support, event service schema, task schema
>>>   * Move to Redfish Specification 1.9.0
>>>   * Redfish support for 2019.4 Schemas
>>>   * GUI enhancements: LDAP, certificate management

We are targeting this Friday, June 5th for release 2.8. I'm not seeing=20
much (or any) discussion on testing. If you have tested the release tag=20
please post the results for your platform. Any blockers?

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgithub.com=5Fope=
nbmc=5Fopenbmc=5Freleases&d=3DDwIDaQ&c=3Djf=5FiaSHvJObTbx-siA1ZOg&r=3DhHlxm=
l=5FLX5HIffRsSFs-k3DrxQDKe6i0A3XGNW7rlIw&m=3DkawJxYAUDgnBEzwq08eGCJz6bv-YZv=
=5FH6QkLZavbRYw&s=3D4KkaACZFdDxq5Phs31Fs=5FnlURFJIXumLI7vz9UiNsRY&e=3D=20


Also, please review and add content to the release notes here:

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=5F=5Fgerrit.openbmc-2=
Dproject.xyz=5Fc=5Fopenbmc=5Fdocs=5F-2B=5F32440&d=3DDwIDaQ&c=3Djf=5FiaSHvJO=
bTbx-siA1ZOg&r=3DhHlxml=5FLX5HIffRsSFs-k3DrxQDKe6i0A3XGNW7rlIw&m=3DkawJxYAU=
DgnBEzwq08eGCJz6bv-YZv=5FH6QkLZavbRYw&s=3DMEQ-gEqOh4TVe=5FI2P8XWbDy3z74mr6c=
LP5PuVrDIw94&e=3D=20


Thanks everyone!

Kurt Taylor (krtaylor)

>>>
>>> And removed "`Redfish configuration backup and restore function`".
>>> James, Jason are you okay with the Redfish list above? Should we add
>>> something about Storage & Drives? Anything else?
>>>
>>> Should we add something about the Kernel? "Move to 5.4"?
>>>
>>> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM
>>> Support" and "Partial MCTP Support".
>>
>> Certainly MCTP support is still "Partial". Slowly progressing with=20
>> help from
>> Intel.
>=20
> Same goes for PLDM. There's definitely more PLDM specs and commands=20
> implemented in libpldm since the 2.7 release though.
>=20
>> Andrew
>>
>=20







--=_alternative 00391A396525857E_=
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 6 URL's were un-rewritten

<span style=3D" font-size:10pt;font-family:sans-serif">Hi All,</span><br><s=
pan style=3D" font-size:10pt;font-family:sans-serif">We tested Firmware
version : 2.8.0-rc1-0-g35a774200 on Witherspoon, and found following issues=
.</span><br><br><span style=3D" font-size:10pt;font-family:sans-serif">DHCP=
 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- </span><a href=3D"=
https://github.com/openbmc/bmcweb/issues/127"><span style=3D" font-size:10p=
t;color:blue;font-family:sans-serif">https://github.com/openbmc/bmcweb/issu=
es/127</span></a><br><span style=3D" font-size:10pt;font-family:sans-serif"=
>LDAP &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - </span><a href=3D=
"https://lists.ozlabs.org/pipermail/openbmc/2020-May/021702.html"><span sty=
le=3D" font-size:10pt;color:blue;font-family:sans-serif">https://lists.ozla=
bs.org/pipermail/openbmc/2020-May/021702.html</span></a><br><span style=3D"=
 font-size:10pt;font-family:sans-serif">VLAN via REST
- </span><a href=3D"https://github.com/openbmc/openbmc/issues/3668"><span s=
tyle=3D" font-size:10pt;color:blue;font-family:sans-serif">https://github.c=
om/openbmc/openbmc/issues/3668</span></a><br><span style=3D" font-size:10pt=
;font-family:sans-serif">VLAN via IPMI
&nbsp; &nbsp; - </span><a href=3D"https://github.com/openbmc/phosphor-net-i=
pmid/issues/12"><span style=3D" font-size:10pt;color:blue;font-family:sans-=
serif">https://github.com/openbmc/phosphor-net-ipmid/issues/12</span></a><b=
r><br><span style=3D" font-size:10pt;font-family:sans-serif">Rest of the fu=
nctionalities
looks good and are stable in our testing.</span><br><span style=3D" font-si=
ze:10pt;font-family:sans-serif">Hope this input
helps.</span><br><br><span style=3D" font-size:10pt;font-family:sans-serif"=
>Prashanth Katti</span><br><br><br><br><br><span style=3D" font-size:9pt;co=
lor:#5f5f5f;font-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">krtaylor
&lt;kurt.r.taylor@gmail.com&gt;</span><br><span style=3D" font-size:9pt;col=
or:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">OpenBMC
Maillist &lt;openbmc@lists.ozlabs.org&gt;</span><br><span style=3D" font-si=
ze:9pt;color:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">03-06-2020
00:46</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:san=
s-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">[EXTERNAL]
Re: OpenBMC 2.8 Release</span><br><span style=3D" font-size:9pt;color:#5f5f=
5f;font-family:sans-serif">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-fa=
mily:sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</span><br><h=
r noshade><br><br><br><tt><span style=3D" font-size:10pt">On 5/4/20 1:29 AM=
, Deepak Kodihalli
wrote:<br>&gt; On 04/05/20 10:43 am, Andrew Jeffery wrote:<br>&gt;&gt;<br>&=
gt;&gt;<br>&gt;&gt; On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:<br>&=
gt;&gt;&gt; On 4/29/2020 10:48 AM, Kurt Taylor wrote:<br>&gt;&gt;&gt;&gt; j=
ust add it directly here:<br>&gt;&gt;&gt;&gt; </span></tt><a href=3D"https:=
//github.com/openbmc/openbmc/wiki/Current-Release-Content"><tt><span style=
=3D" font-size:10pt">https://github.com/openbmc/openbmc/wiki/Current-Releas=
e-Content</span></tt></a><tt><span style=3D" font-size:10pt"><br>&gt;&gt;&g=
t; Added:<br>&gt;&gt;&gt; &nbsp; * Yocto refresh to &quot;Dunfell&quot; ver=
sion 3.1<br>&gt;&gt;&gt; &nbsp; * Redfish support for: full certificate man=
agement,
complete LDAP<br>&gt;&gt;&gt; management, full sensor support, event servic=
e schema, task
schema<br>&gt;&gt;&gt; &nbsp; * Move to Redfish Specification 1.9.0<br>&gt;=
&gt;&gt; &nbsp; * Redfish support for 2019.4 Schemas<br>&gt;&gt;&gt; &nbsp;=
 * GUI enhancements: LDAP, certificate management<br><br>We are targeting t=
his Friday, June 5th for release 2.8. I'm not seeing
<br>much (or any) discussion on testing. If you have tested the release tag
<br>please post the results for your platform. Any blockers?<br><br></span>=
</tt><a href=3D"https://github.com/openbmc/openbmc/releases"><tt><span styl=
e=3D" font-size:10pt">https://github.com/openbmc/openbmc/releases</span></t=
t></a><tt><span style=3D" font-size:10pt"><br><br>Also, please review and a=
dd content to the release notes here:<br><br></span></tt><a href=3D"https:/=
/gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440"><tt><span style=3D" fon=
t-size:10pt">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440</spa=
n></tt></a><tt><span style=3D" font-size:10pt"><br><br>Thanks everyone!<br>=
<br>Kurt Taylor (krtaylor)<br><br>&gt;&gt;&gt;<br>&gt;&gt;&gt; And removed =
&quot;`Redfish configuration backup and restore
function`&quot;.<br>&gt;&gt;&gt; James, Jason are you okay with the Redfish=
 list above? Should
we add<br>&gt;&gt;&gt; something about Storage &amp; Drives? Anything else?=
<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Should we add something about the Kernel? =
&quot;Move to 5.4&quot;?<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Anything for PLDM =
/ MCTP? For the 2.7 release it says &quot;Partial
PLDM<br>&gt;&gt;&gt; Support&quot; and &quot;Partial MCTP Support&quot;.<br=
>&gt;&gt;<br>&gt;&gt; Certainly MCTP support is still &quot;Partial&quot;. =
Slowly progressing
with <br>&gt;&gt; help from<br>&gt;&gt; Intel.<br>&gt; <br>&gt; Same goes f=
or PLDM. There's definitely more PLDM specs and commands
<br>&gt; implemented in libpldm since the 2.7 release though.<br>&gt; <br>&=
gt;&gt; Andrew<br>&gt;&gt;<br>&gt; <br><br></span></tt><br><br><br><BR>

--=_alternative 00391A396525857E_=--

