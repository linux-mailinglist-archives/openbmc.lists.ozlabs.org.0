Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFDA70A85
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 20:32:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMg64525Mz3c3x
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 06:31:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742931113;
	cv=none; b=jMG3sS98n5jm6CM2sLWlvMt43pbrhot1E0U6fhkYxwXTPZOQiL55rcdxIrM7TXmGLqrGU+QhprVjdHkdj6RbYGqqKFBoPpqws0rEzIT9Gd/OXEz7Us0Q/9aShQdK9eWUwe5uEhGHAQT1LfaJpIMYVUHCgQyrvI6V6nX5+nkSxN7tFHiq8WpIuvySD+Z7C9lmn+fTYIPODig0i+VjV8Wf0ik5ZY6lVxe1ZX0wATJYfQsbY5PaBR0VoKbumWq0bl3ezTIoFEvwM6GhL1CqhIDdaziL1LA8W85QDhLQJbwIJVjltl3W5e31GcAlAHRDHz/EhSHP+oLhGZEmRcPVFxpz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742931113; c=relaxed/relaxed;
	bh=yuMuyPAIiLTd1HmHV//Vpc/92R0ei/V2lAFNinMD5Co=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NMnteIeHhEoXUbDmueRIkr+QdZawgSOjpbMEbQp4wvjX91mAxss34EKHkoWiYqs+WWqNyif0UjjBCSApoVTKFqgZ9oxn0956dRg0eNE3FG/EoRb8IaNEICYYtcmXDbJHTO80w/7gdTIrMfbIm5kmdno0YtK/2zCfrGLPfVTTPWJ6b+DgeXpMbLS7tq57zyv6k9vqQB6L/7/GZ9gJUC3VAVur3dQyAlaIggYMXHlvnbmvfrDyRRgXzLuPjFvH5I15LrVk9ZC+/+jhcvc7NQ2ghgueoLB5lNVZbDnGQ4jHse4TTzm18ddZlM+1hA3CXMBqkU7xfonoeeddh4K2/xwu1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZeX+8Fzy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZeX+8Fzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMg5y0qf7z2yRZ
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 06:31:49 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGvlRE023763
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 19:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yuMuyPAIiLTd1HmHV//Vpc/92R0ei/
	V2lAFNinMD5Co=; b=ZeX+8FzymJrJFRGazTL7wV7HO5shT5Kb591cAmCU5FCCzG
	StdLh1DbGpNYYB9uJREEZKPFWmS9z+pue9+yS0YSerHng+ov3sYndfkq8rdBa0CS
	Lk8l39Z2PL1cEo+YBz5hJ+iwn8OcEu2giVEA7DF/861woeAk66KbGbcDBueEKlSW
	ucEEXwy2nyzRfC8i/BN7VWFT5brZFhsZceFjLBMVjeFDe17E7BH1T04nvyOlk3M1
	+A5D3Tes5FgvYqd+0M3+Nk72DooJzylBMgNg9pfev/2+Cld8qDE4sCP8MjffT0wI
	n3lzVMJhQYDhrqt6y8V39tQnJIX80eYGP85b57dw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kekywsyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 19:31:46 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52PJLiTj004480
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 19:31:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45kekywsy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 19:31:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGdJUf020029;
	Tue, 25 Mar 2025 19:31:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hnw0ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 19:31:45 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52PJVi1k50594288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 19:31:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08EDD58054;
	Tue, 25 Mar 2025 19:31:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1D3A58050;
	Tue, 25 Mar 2025 19:31:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.41.97.51])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 25 Mar 2025 19:31:43 +0000 (GMT)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_76D60E26-BF93-4765-AC8D-358C3B7B2640"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Settings backup and restore tool prototype using Ansible -- RFC
 on a published project
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <Z9ftA+zMr2ljEbZg@home.paul.comp>
Date: Tue, 25 Mar 2025 14:31:33 -0500
Message-Id: <F4A34EF4-9572-4863-97BB-8ACA4B7FF1A5@linux.ibm.com>
References: <Z9ftA+zMr2ljEbZg@home.paul.comp>
To: Paul Fertser <fercerpav@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aMjkM_OlW02a9NsKVi1IuoXaY4nYb3Ej
X-Proofpoint-GUID: yElD7O6R2G-nQQ_6_6Y_PRK49mq3CdLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_08,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503250131
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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


--Apple-Mail=_76D60E26-BF93-4765-AC8D-358C3B7B2640
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Some previous discussion on Backup and Restore for reference: =
https://lore.kernel.org/all/YiEbhAQEdJzf706i@heinlein/T/#m50f639da25e073f9=
73e18b5728c15cc1bf61d168

In summary, the DMTF is open to having a schema proposal submitted, =
they're just looking for someone from the OpenBMC community to help =
drive it.


> On Mar 17, 2025, at 4:36=E2=80=AFAM, Paul Fertser =
<fercerpav@gmail.com> wrote:
>=20
> Hello,
>=20
> I was thinking about an "ideal" way to allow backing up and restoring
> the BMC configuration in production and came up with this set of
> goals:
>=20
> 1. The saved config should be easy to inspect and change;
>=20
> 2. It should not require any additional changes on the BMC side, so
>   should be usable not only with OpenBMC but also with other
>   implementations;
>=20
> 3. The tool usage should be easy to automate;
>=20
> 4. The tool should be easy to integrate into larger management
>   systems and it should scale to arbitrary amount of BMCs;
>=20
> 5. It should be as beneficial as possible to the communities using
>   Free Software.
>=20
>=20
> To my surprise I couldn't find any existing solution so following
> these ideas I prepared a prototype and published at
> https://github.com/paulfertser/ansible_redfish_settings .
>=20
> Please feel free to comment on approach and the implementation, and of
> course to provide patches. I have to note I'm not personally herding a
> bunch of servers so my notions can be quite off, do not hesitate to
> point out when it doesn't match real life usecases.
>=20
>=20
> Point 1 is followed by saving config in YAML format, that's nice to
> edit both manually and automatically if needed. Point 2 is fulfilled
> by doing only Redfish interactions, optional Oem settings can be added
> conditionally. Points 3 and 4 come naturally from using Ansible which
> seems to be the most popular system for reproducible mass
> configuration (and much more), so should be familiar to most BMC
> operators. Point 5 is helped by repository organisation which makes it
> natural to submit patches upstream to community.general Ansible
> collection.
>=20
>=20
> While working on this prototype I contributed few changes for missing
> functionality in community.general collection, the experience was
> highly positive as the upstream is welcoming and helpful. So extending
> the project to handle the settings you care about shouldn't be
> problematic, see my changes for example:
>=20
> =
https://github.com/ansible-collections/community.general/commit/e853bdf6f9=
07872fdd39e8c507061269399942e9
> =
https://github.com/ansible-collections/community.general/commit/129f51cf9d=
284d107cf197a1805481c2e4645efe
> =
https://github.com/ansible-collections/community.general/commit/abe4e5ce95=
e6cae4a42629640345e0769c3724a1
>=20
>=20
> Here follows the copy of the project README.md with some more details.
>=20
> # Description #
>=20
> This project aims at providing an easy to use mechanism for creating a
> human-readable and editable BMC settings configuration bundle and for
> reliable idempotent application of them to an arbitrary number of
> machines. It should be possible to use it directly or to seamlessly
> integrate into larger Ansible playbooks as desired. The tasks files
> are provided under MIT licence terms.
>=20
> Added as a submodule is a fork of community.general Ansible
> collection. The changes are minimal: extending backwards compatibility
> and renaming to not clash with system-wide installation. The idea is
> to provide fast, easy and straightforward mechanism to prepare and
> test patches for submitting Github pull requests to upstream
> repository: https://github.com/ansible-collections/community.general .
> After the PRs are merged it's trivial to rebase to get the
> latest-and-greatest code. Please note this collection is published
> under GPL-3.0.
>=20
> The testing was performed against OpenBMC hosts but it should be
> working reasonably with any other Redfish compliant server.
>=20
>=20
> # System requirements #
>=20
> Ansible version 2.10.0 (released in 2020) or later.
>=20
>=20
> # Installation instructions #
>=20
> ```
> # apt install ansible
> $ git clone --recursive =
https://github.com/paulfertser/ansible_redfish_settings
> ```
>=20
> If you really need a fully "standalone" solution, consider packaging =
with
> Nuitka as described here: https://github.com/HexmosTech/Ansika .
>=20
>=20
> # Usage examples #
>=20
> Example command to retrieve all the settings from a single host:
> ```
> $ ansible-playbook get_settings.yaml --extra-vars "baseuri=3D172.41.1.38=
 username=3Droot password=3D0penBmc"
> ```
>=20
> The data will be saved to `settings_172.41.1.38.yaml` file.
>=20
> Example command to set settings for a single host:
> ```
> $ ansible-playbook set_settings.yaml --extra-vars "baseuri=3D172.41.1.38=
 username=3Droot password=3D0penBmc"  --extra-vars =
@settings_172.41.1.38.yaml
> ```
>=20
> The repository includes sample `inventory.ini` which allows to =
retrieve and set
> settings en masse:
> ```
> $ ansible-playbook get_settings.yaml -i inventory.ini
> ```
>=20
> --=20
> Be free, use free (http://www.gnu.org/philosophy/free-sw.html) =
software!
> mailto:fercerpav@gmail.com


--Apple-Mail=_76D60E26-BF93-4765-AC8D-358C3B7B2640
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Some previous =
discussion on Backup and Restore for reference:&nbsp;<a =
href=3D"https://lore.kernel.org/all/YiEbhAQEdJzf706i@heinlein/T/#m50f639da=
25e073f973e18b5728c15cc1bf61d168">https://lore.kernel.org/all/YiEbhAQEdJzf=
706i@heinlein/T/#m50f639da25e073f973e18b5728c15cc1bf61d168</a><div><br></d=
iv><div>In summary, the DMTF is open to having a schema proposal =
submitted, they're just looking for someone from the OpenBMC community =
to help drive it.</div><div><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Mar 17, 2025, at 4:36=E2=80=AFAM, Paul Fertser =
&lt;fercerpav@gmail.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>Hello,<br><br>I was =
thinking about an "ideal" way to allow backing up and restoring<br>the =
BMC configuration in production and came up with this set =
of<br>goals:<br><br>1. The saved config should be easy to inspect and =
change;<br><br>2. It should not require any additional changes on the =
BMC side, so<br> &nbsp;&nbsp;should be usable not only with OpenBMC but =
also with other<br> &nbsp;&nbsp;implementations;<br><br>3. The tool =
usage should be easy to automate;<br><br>4. The tool should be easy to =
integrate into larger management<br> &nbsp;&nbsp;systems and it should =
scale to arbitrary amount of BMCs;<br><br>5. It should be as beneficial =
as possible to the communities using<br> &nbsp;&nbsp;Free =
Software.<br><br><br>To my surprise I couldn't find any existing =
solution so following<br>these ideas I prepared a prototype and =
published at<br>https://github.com/paulfertser/ansible_redfish_settings =
.<br><br>Please feel free to comment on approach and the implementation, =
and of<br>course to provide patches. I have to note I'm not personally =
herding a<br>bunch of servers so my notions can be quite off, do not =
hesitate to<br>point out when it doesn't match real life =
usecases.<br><br><br>Point 1 is followed by saving config in YAML =
format, that's nice to<br>edit both manually and automatically if =
needed. Point 2 is fulfilled<br>by doing only Redfish interactions, =
optional Oem settings can be added<br>conditionally. Points 3 and 4 come =
naturally from using Ansible which<br>seems to be the most popular =
system for reproducible mass<br>configuration (and much more), so should =
be familiar to most BMC<br>operators. Point 5 is helped by repository =
organisation which makes it<br>natural to submit patches upstream to =
community.general Ansible<br>collection.<br><br><br>While working on =
this prototype I contributed few changes for missing<br>functionality in =
community.general collection, the experience was<br>highly positive as =
the upstream is welcoming and helpful. So extending<br>the project to =
handle the settings you care about shouldn't be<br>problematic, see my =
changes for =
example:<br><br>https://github.com/ansible-collections/community.general/c=
ommit/e853bdf6f907872fdd39e8c507061269399942e9<br>https://github.com/ansib=
le-collections/community.general/commit/129f51cf9d284d107cf197a1805481c2e4=
645efe<br>https://github.com/ansible-collections/community.general/commit/=
abe4e5ce95e6cae4a42629640345e0769c3724a1<br><br><br>Here follows the =
copy of the project README.md with some more details.<br><br># =
Description #<br><br>This project aims at providing an easy to use =
mechanism for creating a<br>human-readable and editable BMC settings =
configuration bundle and for<br>reliable idempotent application of them =
to an arbitrary number of<br>machines. It should be possible to use it =
directly or to seamlessly<br>integrate into larger Ansible playbooks as =
desired. The tasks files<br>are provided under MIT licence =
terms.<br><br>Added as a submodule is a fork of community.general =
Ansible<br>collection. The changes are minimal: extending backwards =
compatibility<br>and renaming to not clash with system-wide =
installation. The idea is<br>to provide fast, easy and straightforward =
mechanism to prepare and<br>test patches for submitting Github pull =
requests to upstream<br>repository: =
https://github.com/ansible-collections/community.general .<br>After the =
PRs are merged it's trivial to rebase to get the<br>latest-and-greatest =
code. Please note this collection is published<br>under =
GPL-3.0.<br><br>The testing was performed against OpenBMC hosts but it =
should be<br>working reasonably with any other Redfish compliant =
server.<br><br><br># System requirements #<br><br>Ansible version 2.10.0 =
(released in 2020) or later.<br><br><br># Installation instructions =
#<br><br>```<br># apt install ansible<br>$ git clone --recursive =
https://github.com/paulfertser/ansible_redfish_settings<br>```<br><br>If =
you really need a fully "standalone" solution, consider packaging =
with<br>Nuitka as described here: https://github.com/HexmosTech/Ansika =
.<br><br><br># Usage examples #<br><br>Example command to retrieve all =
the settings from a single host:<br>```<br>$ ansible-playbook =
get_settings.yaml --extra-vars "baseuri=3D172.41.1.38 username=3Droot =
password=3D0penBmc"<br>```<br><br>The data will be saved to =
`settings_172.41.1.38.yaml` file.<br><br>Example command to set settings =
for a single host:<br>```<br>$ ansible-playbook set_settings.yaml =
--extra-vars "baseuri=3D172.41.1.38 username=3Droot password=3D0penBmc" =
&nbsp;--extra-vars @settings_172.41.1.38.yaml<br>```<br><br>The =
repository includes sample `inventory.ini` which allows to retrieve and =
set<br>settings en masse:<br>```<br>$ ansible-playbook get_settings.yaml =
-i inventory.ini<br>```<br><br>-- <br>Be free, use free =
(http://www.gnu.org/philosophy/free-sw.html) =
software!<br>mailto:fercerpav@gmail.com<br></div></div></blockquote></div>=
<br></div></body></html>=

--Apple-Mail=_76D60E26-BF93-4765-AC8D-358C3B7B2640--

