Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7AA42E7B
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 22:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1tR31XpBz3cCx
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 07:59:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740430794;
	cv=none; b=NHmEmb85RE4KpeT1+nUIGnjH4XQrKrNXcdqQOqnOhhhO6Araxq14Dz4siN8MH+1R//dor2RvH3nq8kDOn6GkCCmYIUQp0eNk8Rjt+FYIhe8EbpwuFZNClH898iCn03zpDUTpv78BGLFTTcXdhXP/5JeB8u/mO3BqyA+iCCQNHZgs/13IYkJGfnil1fmfH3UeHy6tPVxXo/x5smXw3uICswO9+eJJB5z3+rQADNNMq81CdFrMlohXOMc4/El5bOWSf85TrtRX21CZdJM9y74/yn91sDMXuzi8If7WoiuVbdG4ppCc9kUT31BiAMKCFl263G25b+kDYxSPjBbZoR54PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740430794; c=relaxed/relaxed;
	bh=AeRiU7HctVW9n5x3CAmZNyPK7i7Tn11VDnzbRcr/w2w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=INEP0mENq+nFTcsU62lMBDFmiGPNtEth1haqWEykWsa5u9iGYo3J7X+Nmrb9ooFulYXIytlavsTRCOlQelSl4U5t7qXI72dgJZgltsdI8QOvaEEeeZ/dQKLebQXXYQLPB+OJ7A4Y+XyACvmJyv77PUjBJcuNjjy8F12au2JEsTolpozV8iIHM40+2j0J4uJpaFHc2KZSBZ3LPMOHuKpaParEJLHc2RhXY0hQhAKeHmF71wAVsycNVC/zRaO0Fmd1Ok1VCf24zaPqs5jKYO5W4jw5sj2B5rgQztS2yJoJ0x6KgaBuSyk8JK7zpPK8GRRc+aO18Q1fD6GD01Si6HG97g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NOwGqoWP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NOwGqoWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1tQw4Ryzz2ygR
	for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2025 07:59:51 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OFPNnA006316
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 20:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=AeRiU7HctVW9n5x3CAmZNyPK7i7Tn1
	1VDnzbRcr/w2w=; b=NOwGqoWPV19dhFlvVX5IcplgIBI252CFrTTTT0rMAbvbNU
	V7Us6k2TJiGND1GceaSZlgigHPGOmZJxNtPaf1DM3yO1cxZxpjVplQTcf6deXflU
	MSAqCqBvITty3wsQsWc7O8xzq1XXXCMbDLUIE3m5H4dePyLBEmGD00/eJbzRg3p2
	VA/eF+6Tu2LS0HaUwIy96UeaFx6x+nlcHGPvcMenS4f2OIfSm/bPdrTKtZT5QEKa
	pN0cNPiM6eGTzg4fCVEjXocaYxqNn8nZw/LX0XuBN5weokmja49oEm0IQNN1QNiw
	0LNta5stty2zH78tLavus4IEc+KweUMjrKUn/nhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450mfp3pr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 20:59:48 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51OKr4Fx029187
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 20:59:48 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450mfp3pr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 20:59:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51OJe86q027479;
	Mon, 24 Feb 2025 20:59:47 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdk92jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 20:59:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51OKxkGl25821800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 20:59:46 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5892C58045;
	Mon, 24 Feb 2025 20:59:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3EFA58052;
	Mon, 24 Feb 2025 20:59:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.37])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 24 Feb 2025 20:59:45 +0000 (GMT)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_81505B47-9B99-49DD-9CE1-FF41AD66341A"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Proposal: Adopting FIPS 204 (ML-DSA) Post-Quantum Encryption
 Standards in BMC Tar Image
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <CAG=JMOXU-Z1zfCSHepgFLSNogoGcgKjrpoEaESkP4_PEOBzscQ@mail.gmail.com>
Date: Mon, 24 Feb 2025 14:59:35 -0600
Message-Id: <3F6F29CC-FD22-4FD6-B6F1-B9A4026B2221@linux.ibm.com>
References: <CAG=JMOXU-Z1zfCSHepgFLSNogoGcgKjrpoEaESkP4_PEOBzscQ@mail.gmail.com>
To: Jishnu Nambiar <jishnunambiarcm@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zPM-v7xep8XBviIjGC8N6v7aJwSMY2I8
X-Proofpoint-GUID: X2gKxEg1PjveGrnSb-TSF0NNZdA8UvKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_10,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240134
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,T_KAM_HTML_FONT_INVALID autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--Apple-Mail=_81505B47-9B99-49DD-9CE1-FF41AD66341A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

OpenBMC currently uses the SHA256 hash algorithm. For the ML-DSA signing =
method seems we'll need to increase the hash and use SHA3-512.

Currently the MANIFEST specifies the hash type to be used via the =
`HashType` field:

HashType=3DRSA-SHA256

Since parsing the MANIFEST file in the phosphor-bmc-code-mgmt repo =
supports multiple duplicated entries, we could add a second `HashType` =
entry to the MANIFEST, that would tie the subdirectory or signature =
names to the hash type that needs to be used, example:

HashType=3DSHA3-512,MLDSA



> On Feb 20, 2025, at 7:10=E2=80=AFAM, Jishnu Nambiar =
<jishnunambiarcm@gmail.com> wrote:
>=20
> This Message Is =46rom an Untrusted Sender
> You have not previously corresponded with this sender.
> Report=C2=A0Suspicious =
<https://us-phishalarm-ewt.proofpoint.com/EWT/v1/AdhS1Rd-!-XFVHHjT_UDUGPna=
I6Sp28PJha3Fj7n1d8eGOcwOGX-JIw8cne1mSsxjMN0cah24IwMj1Ml-NmKDYP10vjrg9ybT2v=
Dnfr5Kjw5vrTMPCEIww0Na7RDdjs_X1Cw$>
> Hello Community,=20
>=20
> I'm proposing an update to the BMC tar image to adopt the FIPS 204 =
(ML-DSA) Post-Quantum Encryption Standards, finalized by NIST =
<https://www.nist.gov/news-events/news/2024/08/nist-releases-first-3-final=
ized-post-quantum-encryption-standards> in August 2024. This update will =
enhance the security and integrity of the image by incorporating a =
post-quantum resistant signing method using ML-DSA, in addition to the =
existing RSA signing method. The proposed design includes the following =
aspects:
>=20
> Generating a new set of private and public key pairs for ML-DSA
> Updating the directory structure to include MLDSA signature files, =
with a proposed structure as follows:=20
> image-rofs.sig=20
> image-kernel.sig
> MANIFEST.sig=20
> publickey=20
> MLDSA/=20
> public_key_MLDSA=20
> image-bmc_MLDSA.sig
> image-hostfw_MLDSA.sig
> image-kernel_MLDSA.sig
> image-rofs_MLDSA.sig
> image-rwfs_MLDSA.sig
> image-u-boot_MLDSA.sig
> MANIFEST_MLDSA.sig
> Modifying the image generation process to support the new signing =
method, including updates to generate and include MLDSA signature files =
in the tar archive
> Updating the manifest to include MLDSA-related information
> Ensuring backward compatibility with existing RSA signing methods to =
allow for a smooth transition to the new ML-DSA signing method. The code =
update will perform ML-DSA verification only if a valid ML-DSA key is =
found on the BMC flash; otherwise, it will skip this check and only =
perform RSA verification. Additionally, if an ML-DSA key is present on =
the BMC flash, an ML-DSA signature is expected to be present in the =
incoming image; if not, the image will be rejected to prevent reverting =
to RSA-only verification by removing ML-DSA signatures from newer =
images.
> Modifying the signature verification process to support both RSA and =
ML-DSA signature validation.
> Please share any feedback or suggestions you may have.
>=20
> Thanks & Regards,
> Jishnu.


--Apple-Mail=_81505B47-9B99-49DD-9CE1-FF41AD66341A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><meta =
http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;">OpenBMC currently uses the SHA256 hash =
algorithm. For the ML-DSA signing method seems we'll need to increase =
the hash and use&nbsp;SHA3-512.<div><br></div><div>Currently the =
MANIFEST specifies the hash type to be used via the `HashType` =
field:</div><div><br></div><div>HashType=3DRSA-SHA256</div><div><br></div>=
<div>Since parsing the MANIFEST file in the phosphor-bmc-code-mgmt repo =
supports multiple duplicated entries, we could add a second `HashType` =
entry to the MANIFEST, that would tie the subdirectory or signature =
names to the hash type that needs to be used, =
example:</div><div><br></div><div>HashType=3DSHA3-512,MLDSA</div><div><br>=
</div><div><br></div><div><div><br><blockquote type=3D"cite"><div>On Feb =
20, 2025, at 7:10=E2=80=AFAM, Jishnu Nambiar =
&lt;jishnunambiarcm@gmail.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><div =
dir=3D"ltr" lang=3D"en" id=3D"pfptBanner9lsnwgc" style=3D"color-scheme: =
revert !important; ruby-position: revert !important; writing-mode: =
revert !important; -webkit-ruby-position: revert !important; color: =
revert !important; font-family: revert !important; =
font-feature-settings: revert !important; font-kerning: revert =
!important; font-optical-sizing: revert !important; font-palette: revert =
!important; font-size: revert !important; font-size-adjust: revert =
!important; font-stretch: revert !important; font-style: revert =
!important; font-synthesis-small-caps: revert !important; =
font-synthesis-style: revert !important; font-synthesis-weight: revert =
!important; font-variant-alternates: revert !important; =
font-variant-caps: revert !important; font-variant-east-asian: revert =
!important; font-variant-emoji: revert !important; =
font-variant-ligatures: revert !important; font-variant-numeric: revert =
!important; font-variant-position: revert !important; =
font-variation-settings: revert !important; font-weight: revert =
!important; text-orientation: revert !important; text-rendering: revert =
!important; zoom: revert !important; -webkit-font-smoothing: revert =
!important; -webkit-locale: revert !important; -webkit-text-size-adjust: =
revert !important; -webkit-text-zoom: revert !important; letter-spacing: =
revert !important; text-autospace: revert !important; text-spacing-trim: =
revert !important; accent-color: revert !important; place-content: =
revert !important; place-items: revert !important; place-self: revert =
!important; alignment-baseline: revert !important; anchor-name: revert =
!important; animation-composition: revert !important; animation: revert =
!important; animation-timeline: revert !important; appearance: revert =
!important; aspect-ratio: revert !important; backdrop-filter: revert =
!important; backface-visibility: revert !important; =
background-attachment: revert !important; background-blend-mode: revert =
!important; background-clip: revert !important; background-image: revert =
!important; background-origin: revert !important; background-position: =
revert !important; background-repeat: revert !important; =
background-size: revert !important; baseline-shift: revert !important; =
line-clamp: revert !important; block-step-insert: revert !important; =
block-step-size: revert !important; border-collapse: revert !important; =
border-image: revert !important; box-shadow: revert !important; =
box-sizing: revert !important; break-after: revert !important; =
break-before: revert !important; break-inside: revert !important; =
buffered-rendering: revert !important; caption-side: revert !important; =
caret-color: revert !important; clear: revert !important; clip: revert =
!important; clip-path: revert !important; clip-rule: revert !important; =
color-interpolation: revert !important; color-interpolation-filters: =
revert !important; column-count: revert !important; column-fill: revert =
!important; gap: revert !important; column-rule-color: revert =
!important; column-rule-style: revert !important; column-rule-width: =
revert !important; column-span: revert !important; column-width: revert =
!important; contain: revert !important; container-name: revert =
!important; container-type: revert !important; content: revert =
!important; content-visibility: revert !important; counter-increment: =
revert !important; counter-reset: revert !important; counter-set: revert =
!important; cursor: revert !important; cx: revert !important; cy: revert =
!important; d: revert !important; dominant-baseline: revert !important; =
empty-cells: revert !important; field-sizing: revert !important; fill: =
revert !important; fill-opacity: revert !important; fill-rule: revert =
!important; filter: revert !important; flex: revert !important; =
flex-flow: revert !important; float: revert !important; flood-color: =
revert !important; flood-opacity: revert !important; =
glyph-orientation-horizontal: revert !important; =
glyph-orientation-vertical: revert !important; grid: revert !important; =
grid-column-end: revert !important; grid-column-start: revert =
!important; grid-row-end: revert !important; grid-row-start: revert =
!important; hanging-punctuation: revert !important; hyphenate-character: =
revert !important; hyphens: revert !important; image-orientation: revert =
!important; image-rendering: revert !important; input-security: revert =
!important; isolation: revert !important; kerning: revert !important; =
lighting-color: revert !important; line-break: revert !important; =
line-fit-edge: revert !important; line-height: revert !important; =
list-style: revert !important; margin-trim: revert !important; marker: =
revert !important; mask: revert !important; mask-composite: revert =
!important; mask-mode: revert !important; mask-size: revert !important; =
mask-type: revert !important; masonry-auto-flow: revert !important; =
math-style: revert !important; mix-blend-mode: revert !important; =
object-fit: revert !important; object-position: revert !important; =
offset-anchor: revert !important; offset-distance: revert !important; =
offset-path: revert !important; offset-position: revert !important; =
offset-rotate: revert !important; order: revert !important; orphans: =
revert !important; outline: revert !important; outline-offset: revert =
!important; overflow-anchor: revert !important; overflow-wrap: revert =
!important; overflow: revert !important; page: revert !important; =
paint-order: revert !important; perspective: revert !important; =
perspective-origin: revert !important; pointer-events: revert =
!important; position: revert !important; position-anchor: revert =
!important; print-color-adjust: revert !important; quotes: revert =
!important; r: revert !important; resize: revert !important; rotate: =
revert !important; ruby-align: revert !important; ruby-overhang: revert =
!important; rx: revert !important; ry: revert !important; scale: revert =
!important; scroll-behavior: revert !important; scroll-snap-align: =
revert !important; scroll-snap-stop: revert !important; =
scroll-snap-type: revert !important; scroll-timeline: revert !important; =
scrollbar-color: revert !important; scrollbar-gutter: revert !important; =
scrollbar-width: revert !important; shape-image-threshold: revert =
!important; shape-margin: revert !important; shape-outside: revert =
!important; shape-rendering: revert !important; speak-as: revert =
!important; stop-color: revert !important; stop-opacity: revert =
!important; stroke: revert !important; stroke-color: revert !important; =
stroke-dasharray: revert !important; stroke-dashoffset: revert =
!important; stroke-linecap: revert !important; stroke-linejoin: revert =
!important; stroke-miterlimit: revert !important; stroke-opacity: revert =
!important; stroke-width: revert !important; tab-size: revert =
!important; table-layout: revert !important; text-align: left =
!important; text-align-last: revert !important; text-anchor: revert =
!important; text-box: revert !important; text-combine-upright: revert =
!important; text-decoration-color: revert !important; text-decoration: =
revert !important; text-decoration-skip-ink: revert !important; =
text-decoration-style: revert !important; text-decoration-thickness: =
revert !important; text-emphasis-color: revert !important; =
text-emphasis-position: revert !important; text-emphasis-style: revert =
!important; text-group-align: revert !important; text-indent: revert =
!important; text-justify: revert !important; text-overflow: revert =
!important; text-shadow: revert !important; text-transform: revert =
!important; text-underline-offset: revert !important; =
text-underline-position: revert !important; text-wrap: revert =
!important; touch-action: revert !important; transform: revert =
!important; transform-box: revert !important; transform-origin: revert =
!important; transform-style: revert !important; transition: revert =
!important; translate: revert !important; vector-effect: revert =
!important; vertical-align: revert !important; view-timeline: revert =
!important; view-transition-class: revert !important; =
view-transition-name: revert !important; white-space: revert !important; =
widows: revert !important; will-change: revert !important; word-break: =
revert !important; x: revert !important; y: revert !important; z-index: =
revert !important; -apple-color-filter: revert !important; =
-apple-pay-button-style: revert !important; -apple-pay-button-type: =
revert !important; -internal-text-autosizing-status: revert !important; =
-webkit-backdrop-filter: revert !important; -webkit-background-clip: =
revert !important; -webkit-background-origin: revert !important; =
border-spacing: revert !important; -webkit-box-align: revert !important; =
-webkit-box-decoration-break: revert !important; -webkit-box-direction: =
revert !important; -webkit-box-flex: revert !important; =
-webkit-box-flex-group: revert !important; -webkit-box-lines: revert =
!important; -webkit-box-ordinal-group: revert !important; =
-webkit-box-orient: revert !important; -webkit-box-pack: revert =
!important; -webkit-box-reflect: revert !important; -webkit-box-shadow: =
revert !important; -webkit-column-axis: revert !important; =
-webkit-column-progression: revert !important; =
-webkit-cursor-visibility: revert !important; -webkit-font-size-delta: =
revert !important; -webkit-hyphenate-limit-after: revert !important; =
-webkit-hyphenate-limit-before: revert !important; =
-webkit-hyphenate-limit-lines: revert !important; =
-webkit-initial-letter: revert !important; -webkit-line-align: revert =
!important; -webkit-line-box-contain: revert !important; =
-webkit-line-clamp: revert !important; -webkit-line-grid: revert =
!important; -webkit-line-snap: revert !important; =
-webkit-marquee-direction: revert !important; -webkit-marquee-increment: =
revert !important; -webkit-marquee-repetition: revert !important; =
-webkit-marquee-speed: revert !important; -webkit-marquee-style: revert =
!important; -webkit-mask: revert !important; -webkit-mask-composite: =
revert !important; -webkit-mask-source-type: revert !important; =
-webkit-nbsp-mode: revert !important; -webkit-rtl-ordering: revert =
!important; -webkit-text-combine: revert !important; =
-webkit-text-decorations-in-effect: revert !important; =
-webkit-text-fill-color: revert !important; -webkit-text-security: =
revert !important; -webkit-text-stroke-color: revert !important; =
-webkit-text-stroke-width: revert !important; -webkit-user-drag: revert =
!important; -webkit-user-modify: revert !important; -webkit-user-select: =
revert !important; word-spacing: revert !important; display: block =
!important; visibility: revert !important; opacity: revert !important; =
background-color: rgb(208, 216, 220) !important; block-size: revert =
!important; border-block: revert !important; border-bottom-color: revert =
!important; border-bottom-style: revert !important; border-bottom-width: =
revert !important; border-end-end-radius: revert !important; =
border-end-start-radius: revert !important; border-inline: revert =
!important; border-left-color: revert !important; border-left-style: =
revert !important; border-left-width: revert !important; =
border-right-color: revert !important; border-right-style: revert =
!important; border-right-width: revert !important; =
border-start-end-radius: revert !important; border-start-start-radius: =
revert !important; inset: revert !important; =
contain-intrinsic-block-size: revert !important; contain-intrinsic-size: =
revert !important; contain-intrinsic-inline-size: revert !important; =
height: revert !important; inline-size: revert !important; inset-block: =
revert !important; inset-inline: revert !important; margin-block: revert =
!important; margin-inline: revert !important; max-block-size: revert =
!important; max-height: revert !important; max-inline-size: revert =
!important; max-width: revert !important; min-block-size: revert =
!important; min-height: revert !important; min-inline-size: revert =
!important; overscroll-behavior-block: revert !important; =
overscroll-behavior-inline: revert !important; overscroll-behavior: =
revert !important; padding-block: revert !important; padding-inline: =
revert !important; scroll-margin-block: revert !important; =
scroll-margin: revert !important; scroll-margin-inline: revert =
!important; scroll-padding-block: revert !important; scroll-padding: =
revert !important; scroll-padding-inline: revert !important; width: =
revert !important; margin: 16px 0px !important; padding: 8px 16px =
!important; border-radius: 4px !important; min-width: 200px !important; =
border-top-width: 4px !important; border-top-style: solid !important; =
border-top-color: rgb(144, 164, 174) !important;"><div =
id=3D"pfptBanner9lsnwgc" style=3D"color-scheme: unset !important; =
ruby-position: unset !important; writing-mode: unset !important; =
-webkit-ruby-position: unset !important; color: unset !important; =
font-family: unset !important; font-feature-settings: unset !important; =
font-kerning: unset !important; font-optical-sizing: unset !important; =
font-palette: unset !important; font-size: unset !important; =
font-size-adjust: unset !important; font-stretch: unset !important; =
font-style: unset !important; font-synthesis-small-caps: unset =
!important; font-synthesis-style: unset !important; =
font-synthesis-weight: unset !important; font-variant-alternates: unset =
!important; font-variant-caps: unset !important; =
font-variant-east-asian: unset !important; font-variant-emoji: unset =
!important; font-variant-ligatures: unset !important; =
font-variant-numeric: unset !important; font-variant-position: unset =
!important; font-variation-settings: unset !important; font-weight: =
unset !important; text-orientation: unset !important; text-rendering: =
unset !important; zoom: unset !important; -webkit-font-smoothing: unset =
!important; -webkit-locale: unset !important; -webkit-text-size-adjust: =
unset !important; -webkit-text-zoom: unset !important; letter-spacing: =
unset !important; text-autospace: unset !important; text-spacing-trim: =
unset !important; accent-color: unset !important; place-content: unset =
!important; place-items: unset !important; place-self: unset !important; =
alignment-baseline: unset !important; anchor-name: unset !important; =
animation-composition: unset !important; animation: unset !important; =
animation-timeline: unset !important; appearance: unset !important; =
aspect-ratio: unset !important; backdrop-filter: unset !important; =
backface-visibility: unset !important; background: unset !important; =
background-blend-mode: unset !important; baseline-shift: unset =
!important; line-clamp: unset !important; block-step-insert: unset =
!important; block-step-size: unset !important; border-collapse: unset =
!important; border: unset !important; box-shadow: unset !important; =
box-sizing: unset !important; break-after: unset !important; =
break-before: unset !important; break-inside: unset !important; =
buffered-rendering: unset !important; caption-side: unset !important; =
caret-color: unset !important; clear: unset !important; clip: unset =
!important; clip-path: unset !important; clip-rule: unset !important; =
color-interpolation: unset !important; color-interpolation-filters: =
unset !important; column-count: unset !important; column-fill: unset =
!important; gap: unset !important; column-rule-color: unset !important; =
column-rule-style: unset !important; column-rule-width: unset =
!important; column-span: unset !important; column-width: unset =
!important; contain: unset !important; container-name: unset !important; =
container-type: unset !important; content: unset !important; =
content-visibility: unset !important; counter-increment: unset =
!important; counter-reset: unset !important; counter-set: unset =
!important; cursor: unset !important; cx: unset !important; cy: unset =
!important; d: unset !important; dominant-baseline: unset !important; =
empty-cells: unset !important; field-sizing: unset !important; fill: =
unset !important; fill-opacity: unset !important; fill-rule: unset =
!important; filter: unset !important; flex: unset !important; flex-flow: =
unset !important; float: left !important; flood-color: unset !important; =
flood-opacity: unset !important; glyph-orientation-horizontal: unset =
!important; glyph-orientation-vertical: unset !important; grid: unset =
!important; grid-column-end: unset !important; grid-column-start: unset =
!important; grid-row-end: unset !important; grid-row-start: unset =
!important; hanging-punctuation: unset !important; hyphenate-character: =
unset !important; hyphens: unset !important; image-orientation: unset =
!important; image-rendering: unset !important; input-security: unset =
!important; isolation: unset !important; kerning: unset !important; =
lighting-color: unset !important; line-break: unset !important; =
line-fit-edge: unset !important; line-height: unset !important; =
list-style: unset !important; margin-trim: unset !important; marker: =
unset !important; mask: unset !important; mask-composite: unset =
!important; mask-mode: unset !important; mask-size: unset !important; =
mask-type: unset !important; masonry-auto-flow: unset !important; =
math-style: unset !important; mix-blend-mode: unset !important; =
object-fit: unset !important; object-position: unset !important; =
offset-anchor: unset !important; offset-distance: unset !important; =
offset-path: unset !important; offset-position: unset !important; =
offset-rotate: unset !important; order: unset !important; orphans: unset =
!important; outline: unset !important; outline-offset: unset !important; =
overflow-anchor: unset !important; overflow-wrap: unset !important; =
overflow: unset !important; page: unset !important; paint-order: unset =
!important; perspective: unset !important; perspective-origin: unset =
!important; pointer-events: unset !important; position: unset =
!important; position-anchor: unset !important; print-color-adjust: unset =
!important; quotes: unset !important; r: unset !important; resize: unset =
!important; rotate: unset !important; ruby-align: unset !important; =
ruby-overhang: unset !important; rx: unset !important; ry: unset =
!important; scale: unset !important; scroll-behavior: unset !important; =
scroll-snap-align: unset !important; scroll-snap-stop: unset !important; =
scroll-snap-type: unset !important; scroll-timeline: unset !important; =
scrollbar-color: unset !important; scrollbar-gutter: unset !important; =
scrollbar-width: unset !important; shape-image-threshold: unset =
!important; shape-margin: unset !important; shape-outside: unset =
!important; shape-rendering: unset !important; speak-as: unset =
!important; stop-color: unset !important; stop-opacity: unset =
!important; stroke: unset !important; stroke-color: unset !important; =
stroke-dasharray: unset !important; stroke-dashoffset: unset !important; =
stroke-linecap: unset !important; stroke-linejoin: unset !important; =
stroke-miterlimit: unset !important; stroke-opacity: unset !important; =
stroke-width: unset !important; tab-size: unset !important; =
table-layout: unset !important; text-align: unset !important; =
text-align-last: unset !important; text-anchor: unset !important; =
text-box: unset !important; text-combine-upright: unset !important; =
text-decoration-color: unset !important; text-decoration: unset =
!important; text-decoration-skip-ink: unset !important; =
text-decoration-style: unset !important; text-decoration-thickness: =
unset !important; text-emphasis-color: unset !important; =
text-emphasis-position: unset !important; text-emphasis-style: unset =
!important; text-group-align: unset !important; text-indent: unset =
!important; text-justify: unset !important; text-overflow: unset =
!important; text-shadow: unset !important; text-transform: unset =
!important; text-underline-offset: unset !important; =
text-underline-position: unset !important; text-wrap: unset !important; =
touch-action: unset !important; transform: unset !important; =
transform-box: unset !important; transform-origin: unset !important; =
transform-style: unset !important; transition: unset !important; =
translate: unset !important; vector-effect: unset !important; =
vertical-align: unset !important; view-timeline: unset !important; =
view-transition-class: unset !important; view-transition-name: unset =
!important; white-space: unset !important; widows: unset !important; =
will-change: unset !important; word-break: unset !important; x: unset =
!important; y: unset !important; z-index: unset !important; =
-apple-color-filter: unset !important; -apple-pay-button-style: unset =
!important; -apple-pay-button-type: unset !important; =
-internal-text-autosizing-status: unset !important; =
-webkit-backdrop-filter: unset !important; -webkit-background-clip: =
unset !important; -webkit-background-origin: unset !important; =
border-spacing: unset !important; -webkit-box-align: unset !important; =
-webkit-box-decoration-break: unset !important; -webkit-box-direction: =
unset !important; -webkit-box-flex: unset !important; =
-webkit-box-flex-group: unset !important; -webkit-box-lines: unset =
!important; -webkit-box-ordinal-group: unset !important; =
-webkit-box-orient: unset !important; -webkit-box-pack: unset =
!important; -webkit-box-reflect: unset !important; -webkit-box-shadow: =
unset !important; -webkit-column-axis: unset !important; =
-webkit-column-progression: unset !important; -webkit-cursor-visibility: =
unset !important; -webkit-font-size-delta: unset !important; =
-webkit-hyphenate-limit-after: unset !important; =
-webkit-hyphenate-limit-before: unset !important; =
-webkit-hyphenate-limit-lines: unset !important; -webkit-initial-letter: =
unset !important; -webkit-line-align: unset !important; =
-webkit-line-box-contain: unset !important; -webkit-line-clamp: unset =
!important; -webkit-line-grid: unset !important; -webkit-line-snap: =
unset !important; -webkit-marquee-direction: unset !important; =
-webkit-marquee-increment: unset !important; -webkit-marquee-repetition: =
unset !important; -webkit-marquee-speed: unset !important; =
-webkit-marquee-style: unset !important; -webkit-mask: unset !important; =
-webkit-mask-composite: unset !important; -webkit-mask-source-type: =
unset !important; -webkit-nbsp-mode: unset !important; =
-webkit-rtl-ordering: unset !important; -webkit-text-combine: unset =
!important; -webkit-text-decorations-in-effect: unset !important; =
-webkit-text-fill-color: unset !important; -webkit-text-security: unset =
!important; -webkit-text-stroke-color: unset !important; =
-webkit-text-stroke-width: unset !important; -webkit-user-drag: unset =
!important; -webkit-user-modify: unset !important; -webkit-user-select: =
unset !important; word-spacing: unset !important; display: block =
!important; visibility: unset !important; opacity: unset !important; =
block-size: unset !important; border-block: unset !important; =
border-radius: unset !important; border-end-end-radius: unset =
!important; border-end-start-radius: unset !important; border-inline: =
unset !important; border-start-end-radius: unset !important; =
border-start-start-radius: unset !important; inset: unset !important; =
contain-intrinsic-block-size: unset !important; contain-intrinsic-size: =
unset !important; contain-intrinsic-inline-size: unset !important; =
height: unset !important; inline-size: unset !important; inset-block: =
unset !important; inset-inline: unset !important; margin-block: unset =
!important; margin-inline: unset !important; max-block-size: unset =
!important; max-height: unset !important; max-inline-size: unset =
!important; min-block-size: unset !important; min-height: unset =
!important; min-inline-size: unset !important; min-width: unset =
!important; overscroll-behavior-block: unset !important; =
overscroll-behavior-inline: unset !important; overscroll-behavior: unset =
!important; padding-block: unset !important; padding: unset !important; =
padding-inline: unset !important; scroll-margin-block: unset !important; =
scroll-margin: unset !important; scroll-margin-inline: unset !important; =
scroll-padding-block: unset !important; scroll-padding: unset =
!important; scroll-padding-inline: unset !important; width: unset =
!important; margin: 0px 0px 1px !important; max-width: 600px =
!important;"><div id=3D"pfptBanner9lsnwgc" style=3D"color-scheme: unset =
!important; ruby-position: unset !important; writing-mode: unset =
!important; -webkit-ruby-position: unset !important; font-family: Arial, =
sans-serif !important; font-feature-settings: unset !important; =
font-kerning: unset !important; font-optical-sizing: unset !important; =
font-palette: unset !important; font-size: 14px !important; =
font-size-adjust: unset !important; font-stretch: unset !important; =
font-style: unset !important; font-synthesis-small-caps: unset =
!important; font-synthesis-style: unset !important; =
font-synthesis-weight: unset !important; font-variant-alternates: unset =
!important; font-variant-caps: unset !important; =
font-variant-east-asian: unset !important; font-variant-ligatures: unset =
!important; font-variant-numeric: unset !important; =
font-variant-position: unset !important; font-variation-settings: unset =
!important; font-weight: bold !important; text-orientation: unset =
!important; text-rendering: unset !important; zoom: unset !important; =
-webkit-font-smoothing: unset !important; -webkit-locale: unset =
!important; -webkit-text-zoom: unset !important; letter-spacing: unset =
!important; accent-color: unset !important; place-content: unset =
!important; place-items: unset !important; place-self: unset !important; =
alignment-baseline: unset !important; animation-composition: unset =
!important; animation: unset !important; appearance: unset !important; =
aspect-ratio: unset !important; backdrop-filter: unset !important; =
backface-visibility: unset !important; background-attachment: unset =
!important; background-blend-mode: unset !important; background-clip: =
unset !important; background-image: unset !important; background-origin: =
unset !important; background-position: unset !important; =
background-repeat: unset !important; background-size: unset !important; =
baseline-shift: unset !important; line-clamp: unset !important; =
border-collapse: unset !important; border: unset !important; box-shadow: =
unset !important; box-sizing: unset !important; break-after: unset =
!important; break-before: unset !important; break-inside: unset =
!important; buffered-rendering: unset !important; caption-side: unset =
!important; caret-color: unset !important; clear: unset !important; =
clip: unset !important; clip-path: unset !important; clip-rule: unset =
!important; color-interpolation: unset !important; =
color-interpolation-filters: unset !important; column-count: unset =
!important; column-fill: unset !important; gap: unset !important; =
column-rule-color: unset !important; column-rule-style: unset =
!important; column-rule-width: unset !important; column-span: unset =
!important; column-width: unset !important; contain: unset !important; =
container-name: unset !important; container-type: unset !important; =
content: unset !important; content-visibility: unset !important; =
counter-increment: unset !important; counter-reset: unset !important; =
counter-set: unset !important; cursor: unset !important; cx: unset =
!important; cy: unset !important; dominant-baseline: unset !important; =
empty-cells: unset !important; fill: unset !important; fill-opacity: =
unset !important; fill-rule: unset !important; filter: unset !important; =
flex: unset !important; flex-flow: unset !important; float: unset =
!important; flood-color: unset !important; flood-opacity: unset =
!important; glyph-orientation-horizontal: unset !important; =
glyph-orientation-vertical: unset !important; grid: unset !important; =
grid-column-end: unset !important; grid-column-start: unset !important; =
grid-row-end: unset !important; grid-row-start: unset !important; =
hanging-punctuation: unset !important; hyphenate-character: unset =
!important; hyphens: unset !important; image-orientation: unset =
!important; image-rendering: unset !important; isolation: unset =
!important; kerning: unset !important; lighting-color: unset !important; =
line-break: unset !important; line-height: 18px !important; list-style: =
unset !important; margin-trim: unset !important; marker: unset =
!important; mask: unset !important; mask-composite: unset !important; =
mask-mode: unset !important; mask-type: unset !important; math-style: =
unset !important; mix-blend-mode: unset !important; object-fit: unset =
!important; object-position: unset !important; offset-anchor: unset =
!important; offset-distance: unset !important; offset-path: unset =
!important; offset-position: unset !important; offset-rotate: unset =
!important; order: unset !important; orphans: unset !important; outline: =
unset !important; outline-offset: unset !important; overflow-wrap: unset =
!important; overflow: unset !important; page: unset !important; =
paint-order: unset !important; perspective: unset !important; =
perspective-origin: unset !important; pointer-events: unset !important; =
position: unset !important; print-color-adjust: unset !important; =
quotes: unset !important; r: unset !important; resize: unset !important; =
rotate: unset !important; ruby-align: unset !important; ruby-overhang: =
unset !important; rx: unset !important; ry: unset !important; scale: =
unset !important; scroll-behavior: unset !important; scroll-snap-align: =
unset !important; scroll-snap-stop: unset !important; scroll-snap-type: =
unset !important; scrollbar-gutter: unset !important; scrollbar-width: =
unset !important; shape-image-threshold: unset !important; shape-margin: =
unset !important; shape-outside: unset !important; shape-rendering: =
unset !important; speak-as: unset !important; stop-color: unset =
!important; stop-opacity: unset !important; stroke: unset !important; =
stroke-color: unset !important; stroke-dasharray: unset !important; =
stroke-dashoffset: unset !important; stroke-linecap: unset !important; =
stroke-linejoin: unset !important; stroke-miterlimit: unset !important; =
stroke-opacity: unset !important; stroke-width: unset !important; =
tab-size: unset !important; table-layout: unset !important; text-align: =
unset !important; text-align-last: unset !important; text-anchor: unset =
!important; text-box: unset !important; text-combine-upright: unset =
!important; text-decoration-color: unset !important; text-decoration: =
unset !important; text-decoration-skip-ink: unset !important; =
text-decoration-style: unset !important; text-decoration-thickness: =
unset !important; text-emphasis-color: unset !important; =
text-emphasis-position: unset !important; text-emphasis-style: unset =
!important; text-indent: unset !important; text-overflow: unset =
!important; text-shadow: unset !important; text-transform: unset =
!important; text-underline-offset: unset !important; =
text-underline-position: unset !important; text-wrap: unset !important; =
touch-action: unset !important; transform: unset !important; =
transform-box: unset !important; transform-origin: unset !important; =
transform-style: unset !important; transition: unset !important; =
translate: unset !important; vector-effect: unset !important; =
vertical-align: unset !important; view-transition-class: unset =
!important; view-transition-name: unset !important; white-space: unset =
!important; widows: unset !important; will-change: unset !important; =
word-break: unset !important; x: unset !important; y: unset !important; =
z-index: unset !important; -apple-color-filter: unset !important; =
-apple-pay-button-style: unset !important; -apple-pay-button-type: unset =
!important; -webkit-backdrop-filter: unset !important; =
-webkit-background-clip: unset !important; -webkit-background-origin: =
unset !important; border-spacing: unset !important; -webkit-box-align: =
unset !important; -webkit-box-decoration-break: unset !important; =
-webkit-box-direction: unset !important; -webkit-box-flex: unset =
!important; -webkit-box-flex-group: unset !important; -webkit-box-lines: =
unset !important; -webkit-box-ordinal-group: unset !important; =
-webkit-box-orient: unset !important; -webkit-box-pack: unset =
!important; -webkit-box-reflect: unset !important; -webkit-box-shadow: =
unset !important; -webkit-column-axis: unset !important; =
-webkit-column-progression: unset !important; -webkit-cursor-visibility: =
unset !important; -webkit-hyphenate-limit-after: unset !important; =
-webkit-hyphenate-limit-before: unset !important; =
-webkit-hyphenate-limit-lines: unset !important; -webkit-initial-letter: =
unset !important; -webkit-line-align: unset !important; =
-webkit-line-box-contain: unset !important; -webkit-line-clamp: unset =
!important; -webkit-line-grid: unset !important; -webkit-line-snap: =
unset !important; mask-size: unset !important; -webkit-mask: unset =
!important; -webkit-mask-composite: unset !important; =
-webkit-mask-source-type: unset !important; -webkit-nbsp-mode: unset =
!important; -webkit-rtl-ordering: unset !important; =
-webkit-text-combine: unset !important; =
-webkit-text-decorations-in-effect: unset !important; =
-webkit-text-fill-color: unset !important; -webkit-text-security: unset =
!important; -webkit-text-stroke-color: unset !important; =
-webkit-text-stroke-width: unset !important; -webkit-user-drag: unset =
!important; -webkit-user-modify: unset !important; -webkit-user-select: =
unset !important; word-spacing: unset !important; display: block =
!important; visibility: visible !important; opacity: unset !important; =
background-color: rgb(208, 216, 220) !important; block-size: unset =
!important; border-block: unset !important; border-radius: unset =
!important; border-end-end-radius: unset !important; =
border-end-start-radius: unset !important; border-inline: unset =
!important; border-start-end-radius: unset !important; =
border-start-start-radius: unset !important; inset: unset !important; =
contain-intrinsic-block-size: unset !important; contain-intrinsic-size: =
unset !important; contain-intrinsic-inline-size: unset !important; =
height: unset !important; inline-size: unset !important; inset-block: =
unset !important; inset-inline: unset !important; margin-block: unset =
!important; margin: unset !important; margin-inline: unset !important; =
max-block-size: unset !important; max-height: unset !important; =
max-inline-size: unset !important; max-width: unset !important; =
min-block-size: unset !important; min-height: unset !important; =
min-inline-size: unset !important; min-width: unset !important; =
overscroll-behavior-block: unset !important; overscroll-behavior-inline: =
unset !important; overscroll-behavior: unset !important; padding-block: =
unset !important; padding: unset !important; padding-inline: unset =
!important; scroll-margin-block: unset !important; scroll-margin: unset =
!important; scroll-margin-inline: unset !important; =
scroll-padding-block: unset !important; scroll-padding: unset =
!important; scroll-padding-inline: unset !important; width: unset =
!important;">This Message Is =46rom an Untrusted Sender</div><div =
id=3D"pfptBanner9lsnwgc" style=3D"color-scheme: unset !important; =
ruby-position: unset !important; writing-mode: unset !important; =
-webkit-ruby-position: unset !important; font-family: Arial, sans-serif =
!important; font-feature-settings: unset !important; font-kerning: unset =
!important; font-optical-sizing: unset !important; font-palette: unset =
!important; font-size: 12px !important; font-size-adjust: unset =
!important; font-stretch: unset !important; font-style: unset =
!important; font-synthesis-small-caps: unset !important; =
font-synthesis-style: unset !important; font-synthesis-weight: unset =
!important; font-variant-alternates: unset !important; =
font-variant-caps: unset !important; font-variant-east-asian: unset =
!important; font-variant-ligatures: unset !important; =
font-variant-numeric: unset !important; font-variant-position: unset =
!important; font-variation-settings: unset !important; font-weight: =
unset !important; text-orientation: unset !important; text-rendering: =
unset !important; zoom: unset !important; -webkit-font-smoothing: unset =
!important; -webkit-locale: unset !important; -webkit-text-zoom: unset =
!important; letter-spacing: unset !important; accent-color: unset =
!important; place-content: unset !important; place-items: unset =
!important; place-self: unset !important; alignment-baseline: unset =
!important; animation-composition: unset !important; animation: unset =
!important; appearance: unset !important; aspect-ratio: unset =
!important; backdrop-filter: unset !important; backface-visibility: =
unset !important; background-attachment: unset !important; =
background-blend-mode: unset !important; background-clip: unset =
!important; background-image: unset !important; background-origin: unset =
!important; background-position: unset !important; background-repeat: =
unset !important; background-size: unset !important; baseline-shift: =
unset !important; line-clamp: unset !important; border-collapse: unset =
!important; border: unset !important; box-shadow: unset !important; =
box-sizing: unset !important; break-after: unset !important; =
break-before: unset !important; break-inside: unset !important; =
buffered-rendering: unset !important; caption-side: unset !important; =
caret-color: unset !important; clear: unset !important; clip: unset =
!important; clip-path: unset !important; clip-rule: unset !important; =
color-interpolation: unset !important; color-interpolation-filters: =
unset !important; column-count: unset !important; column-fill: unset =
!important; gap: unset !important; column-rule-color: unset !important; =
column-rule-style: unset !important; column-rule-width: unset =
!important; column-span: unset !important; column-width: unset =
!important; contain: unset !important; container-name: unset !important; =
container-type: unset !important; content: unset !important; =
content-visibility: unset !important; counter-increment: unset =
!important; counter-reset: unset !important; counter-set: unset =
!important; cursor: unset !important; cx: unset !important; cy: unset =
!important; dominant-baseline: unset !important; empty-cells: unset =
!important; fill: unset !important; fill-opacity: unset !important; =
fill-rule: unset !important; filter: unset !important; flex: unset =
!important; flex-flow: unset !important; float: unset !important; =
flood-color: unset !important; flood-opacity: unset !important; =
glyph-orientation-horizontal: unset !important; =
glyph-orientation-vertical: unset !important; grid: unset !important; =
grid-column-end: unset !important; grid-column-start: unset !important; =
grid-row-end: unset !important; grid-row-start: unset !important; =
hanging-punctuation: unset !important; hyphenate-character: unset =
!important; hyphens: unset !important; image-orientation: unset =
!important; image-rendering: unset !important; isolation: unset =
!important; kerning: unset !important; lighting-color: unset !important; =
line-break: unset !important; line-height: 18px !important; list-style: =
unset !important; margin-trim: unset !important; marker: unset =
!important; mask: unset !important; mask-composite: unset !important; =
mask-mode: unset !important; mask-type: unset !important; math-style: =
unset !important; mix-blend-mode: unset !important; object-fit: unset =
!important; object-position: unset !important; offset-anchor: unset =
!important; offset-distance: unset !important; offset-path: unset =
!important; offset-position: unset !important; offset-rotate: unset =
!important; order: unset !important; orphans: unset !important; outline: =
unset !important; outline-offset: unset !important; overflow-wrap: unset =
!important; overflow: unset !important; page: unset !important; =
paint-order: unset !important; perspective: unset !important; =
perspective-origin: unset !important; pointer-events: unset !important; =
position: unset !important; print-color-adjust: unset !important; =
quotes: unset !important; r: unset !important; resize: unset !important; =
rotate: unset !important; ruby-align: unset !important; ruby-overhang: =
unset !important; rx: unset !important; ry: unset !important; scale: =
unset !important; scroll-behavior: unset !important; scroll-snap-align: =
unset !important; scroll-snap-stop: unset !important; scroll-snap-type: =
unset !important; scrollbar-gutter: unset !important; scrollbar-width: =
unset !important; shape-image-threshold: unset !important; shape-margin: =
unset !important; shape-outside: unset !important; shape-rendering: =
unset !important; speak-as: unset !important; stop-color: unset =
!important; stop-opacity: unset !important; stroke: unset !important; =
stroke-color: unset !important; stroke-dasharray: unset !important; =
stroke-dashoffset: unset !important; stroke-linecap: unset !important; =
stroke-linejoin: unset !important; stroke-miterlimit: unset !important; =
stroke-opacity: unset !important; stroke-width: unset !important; =
tab-size: unset !important; table-layout: unset !important; text-align: =
unset !important; text-align-last: unset !important; text-anchor: unset =
!important; text-box: unset !important; text-combine-upright: unset =
!important; text-decoration-color: unset !important; text-decoration: =
unset !important; text-decoration-skip-ink: unset !important; =
text-decoration-style: unset !important; text-decoration-thickness: =
unset !important; text-emphasis-color: unset !important; =
text-emphasis-position: unset !important; text-emphasis-style: unset =
!important; text-indent: unset !important; text-overflow: unset =
!important; text-shadow: unset !important; text-transform: unset =
!important; text-underline-offset: unset !important; =
text-underline-position: unset !important; text-wrap: unset !important; =
touch-action: unset !important; transform: unset !important; =
transform-box: unset !important; transform-origin: unset !important; =
transform-style: unset !important; transition: unset !important; =
translate: unset !important; vector-effect: unset !important; =
vertical-align: unset !important; view-transition-class: unset =
!important; view-transition-name: unset !important; white-space: unset =
!important; widows: unset !important; will-change: unset !important; =
word-break: unset !important; x: unset !important; y: unset !important; =
z-index: unset !important; -apple-color-filter: unset !important; =
-apple-pay-button-style: unset !important; -apple-pay-button-type: unset =
!important; -webkit-backdrop-filter: unset !important; =
-webkit-background-clip: unset !important; -webkit-background-origin: =
unset !important; border-spacing: unset !important; -webkit-box-align: =
unset !important; -webkit-box-decoration-break: unset !important; =
-webkit-box-direction: unset !important; -webkit-box-flex: unset =
!important; -webkit-box-flex-group: unset !important; -webkit-box-lines: =
unset !important; -webkit-box-ordinal-group: unset !important; =
-webkit-box-orient: unset !important; -webkit-box-pack: unset =
!important; -webkit-box-reflect: unset !important; -webkit-box-shadow: =
unset !important; -webkit-column-axis: unset !important; =
-webkit-column-progression: unset !important; -webkit-cursor-visibility: =
unset !important; -webkit-hyphenate-limit-after: unset !important; =
-webkit-hyphenate-limit-before: unset !important; =
-webkit-hyphenate-limit-lines: unset !important; -webkit-initial-letter: =
unset !important; -webkit-line-align: unset !important; =
-webkit-line-box-contain: unset !important; -webkit-line-clamp: unset =
!important; -webkit-line-grid: unset !important; -webkit-line-snap: =
unset !important; mask-size: unset !important; -webkit-mask: unset =
!important; -webkit-mask-composite: unset !important; =
-webkit-mask-source-type: unset !important; -webkit-nbsp-mode: unset =
!important; -webkit-rtl-ordering: unset !important; =
-webkit-text-combine: unset !important; =
-webkit-text-decorations-in-effect: unset !important; =
-webkit-text-fill-color: unset !important; -webkit-text-security: unset =
!important; -webkit-text-stroke-color: unset !important; =
-webkit-text-stroke-width: unset !important; -webkit-user-drag: unset =
!important; -webkit-user-modify: unset !important; -webkit-user-select: =
unset !important; word-spacing: unset !important; display: block =
!important; visibility: visible !important; opacity: unset !important; =
background-color: rgb(208, 216, 220) !important; block-size: unset =
!important; border-block: unset !important; border-radius: unset =
!important; border-end-end-radius: unset !important; =
border-end-start-radius: unset !important; border-inline: unset =
!important; border-start-end-radius: unset !important; =
border-start-start-radius: unset !important; inset: unset !important; =
contain-intrinsic-block-size: unset !important; contain-intrinsic-size: =
unset !important; contain-intrinsic-inline-size: unset !important; =
height: unset !important; inline-size: unset !important; inset-block: =
unset !important; inset-inline: unset !important; margin-block: unset =
!important; margin-bottom: unset !important; margin-inline: unset =
!important; margin-left: unset !important; margin-right: unset =
!important; max-block-size: unset !important; max-height: unset =
!important; max-inline-size: unset !important; max-width: unset =
!important; min-block-size: unset !important; min-height: unset =
!important; min-inline-size: unset !important; min-width: unset =
!important; overscroll-behavior-block: unset !important; =
overscroll-behavior-inline: unset !important; overscroll-behavior: unset =
!important; padding-block: unset !important; padding: unset !important; =
padding-inline: unset !important; scroll-margin-block: unset !important; =
scroll-margin: unset !important; scroll-margin-inline: unset !important; =
scroll-padding-block: unset !important; scroll-padding: unset =
!important; scroll-padding-inline: unset !important; width: unset =
!important; margin-top: 2px !important;">You have not previously =
corresponded with this sender.</div></div><div id=3D"pfptBanner9lsnwgc" =
style=3D"color-scheme: unset !important; ruby-position: unset =
!important; writing-mode: unset !important; -webkit-ruby-position: unset =
!important; color: unset !important; font-family: unset !important; =
font-feature-settings: unset !important; font-kerning: unset !important; =
font-optical-sizing: unset !important; font-palette: unset !important; =
font-size: unset !important; font-size-adjust: unset !important; =
font-stretch: unset !important; font-style: unset !important; =
font-synthesis-small-caps: unset !important; font-synthesis-style: unset =
!important; font-synthesis-weight: unset !important; =
font-variant-alternates: unset !important; font-variant-caps: unset =
!important; font-variant-east-asian: unset !important; =
font-variant-emoji: unset !important; font-variant-ligatures: unset =
!important; font-variant-numeric: unset !important; =
font-variant-position: unset !important; font-variation-settings: unset =
!important; font-weight: unset !important; text-orientation: unset =
!important; text-rendering: unset !important; zoom: unset !important; =
-webkit-font-smoothing: unset !important; -webkit-locale: unset =
!important; -webkit-text-size-adjust: unset !important; =
-webkit-text-zoom: unset !important; letter-spacing: unset !important; =
text-autospace: unset !important; text-spacing-trim: unset !important; =
accent-color: unset !important; place-content: unset !important; =
place-items: unset !important; place-self: unset !important; =
alignment-baseline: unset !important; anchor-name: unset !important; =
animation-composition: unset !important; animation: unset !important; =
animation-timeline: unset !important; appearance: unset !important; =
aspect-ratio: unset !important; backdrop-filter: unset !important; =
backface-visibility: unset !important; background: unset !important; =
background-blend-mode: unset !important; baseline-shift: unset =
!important; line-clamp: unset !important; block-step-insert: unset =
!important; block-step-size: unset !important; border-collapse: unset =
!important; border: unset !important; box-shadow: unset !important; =
box-sizing: unset !important; break-after: unset !important; =
break-before: unset !important; break-inside: unset !important; =
buffered-rendering: unset !important; caption-side: unset !important; =
caret-color: unset !important; clear: unset !important; clip: unset =
!important; clip-path: unset !important; clip-rule: unset !important; =
color-interpolation: unset !important; color-interpolation-filters: =
unset !important; column-count: unset !important; column-fill: unset =
!important; gap: unset !important; column-rule-color: unset !important; =
column-rule-style: unset !important; column-rule-width: unset =
!important; column-span: unset !important; column-width: unset =
!important; contain: unset !important; container-name: unset !important; =
container-type: unset !important; content: unset !important; =
content-visibility: unset !important; counter-increment: unset =
!important; counter-reset: unset !important; counter-set: unset =
!important; cursor: unset !important; cx: unset !important; cy: unset =
!important; d: unset !important; dominant-baseline: unset !important; =
empty-cells: unset !important; field-sizing: unset !important; fill: =
unset !important; fill-opacity: unset !important; fill-rule: unset =
!important; filter: unset !important; flex: unset !important; flex-flow: =
unset !important; float: right !important; flood-color: unset =
!important; flood-opacity: unset !important; =
glyph-orientation-horizontal: unset !important; =
glyph-orientation-vertical: unset !important; grid: unset !important; =
grid-column-end: unset !important; grid-column-start: unset !important; =
grid-row-end: unset !important; grid-row-start: unset !important; =
hanging-punctuation: unset !important; hyphenate-character: unset =
!important; hyphens: unset !important; image-orientation: unset =
!important; image-rendering: unset !important; input-security: unset =
!important; isolation: unset !important; kerning: unset !important; =
lighting-color: unset !important; line-break: unset !important; =
line-fit-edge: unset !important; line-height: unset !important; =
list-style: unset !important; margin-trim: unset !important; marker: =
unset !important; mask: unset !important; mask-composite: unset =
!important; mask-mode: unset !important; mask-size: unset !important; =
mask-type: unset !important; masonry-auto-flow: unset !important; =
math-style: unset !important; mix-blend-mode: unset !important; =
object-fit: unset !important; object-position: unset !important; =
offset-anchor: unset !important; offset-distance: unset !important; =
offset-path: unset !important; offset-position: unset !important; =
offset-rotate: unset !important; order: unset !important; orphans: unset =
!important; outline: unset !important; outline-offset: unset !important; =
overflow-anchor: unset !important; overflow-wrap: unset !important; =
overflow: unset !important; page: unset !important; paint-order: unset =
!important; perspective: unset !important; perspective-origin: unset =
!important; pointer-events: unset !important; position: unset =
!important; position-anchor: unset !important; print-color-adjust: unset =
!important; quotes: unset !important; r: unset !important; resize: unset =
!important; rotate: unset !important; ruby-align: unset !important; =
ruby-overhang: unset !important; rx: unset !important; ry: unset =
!important; scale: unset !important; scroll-behavior: unset !important; =
scroll-snap-align: unset !important; scroll-snap-stop: unset !important; =
scroll-snap-type: unset !important; scroll-timeline: unset !important; =
scrollbar-color: unset !important; scrollbar-gutter: unset !important; =
scrollbar-width: unset !important; shape-image-threshold: unset =
!important; shape-margin: unset !important; shape-outside: unset =
!important; shape-rendering: unset !important; speak-as: unset =
!important; stop-color: unset !important; stop-opacity: unset =
!important; stroke: unset !important; stroke-color: unset !important; =
stroke-dasharray: unset !important; stroke-dashoffset: unset !important; =
stroke-linecap: unset !important; stroke-linejoin: unset !important; =
stroke-miterlimit: unset !important; stroke-opacity: unset !important; =
stroke-width: unset !important; tab-size: unset !important; =
table-layout: unset !important; text-align: right !important; =
text-align-last: unset !important; text-anchor: unset !important; =
text-box: unset !important; text-combine-upright: unset !important; =
text-decoration-color: unset !important; text-decoration: unset =
!important; text-decoration-skip-ink: unset !important; =
text-decoration-style: unset !important; text-decoration-thickness: =
unset !important; text-emphasis-color: unset !important; =
text-emphasis-position: unset !important; text-emphasis-style: unset =
!important; text-group-align: unset !important; text-indent: unset =
!important; text-justify: unset !important; text-overflow: unset =
!important; text-shadow: unset !important; text-transform: unset =
!important; text-underline-offset: unset !important; =
text-underline-position: unset !important; text-wrap: unset !important; =
touch-action: unset !important; transform: unset !important; =
transform-box: unset !important; transform-origin: unset !important; =
transform-style: unset !important; transition: unset !important; =
translate: unset !important; vector-effect: unset !important; =
vertical-align: unset !important; view-timeline: unset !important; =
view-transition-class: unset !important; view-transition-name: unset =
!important; white-space: unset !important; widows: unset !important; =
will-change: unset !important; word-break: unset !important; x: unset =
!important; y: unset !important; z-index: unset !important; =
-apple-color-filter: unset !important; -apple-pay-button-style: unset =
!important; -apple-pay-button-type: unset !important; =
-internal-text-autosizing-status: unset !important; =
-webkit-backdrop-filter: unset !important; -webkit-background-clip: =
unset !important; -webkit-background-origin: unset !important; =
border-spacing: unset !important; -webkit-box-align: unset !important; =
-webkit-box-decoration-break: unset !important; -webkit-box-direction: =
unset !important; -webkit-box-flex: unset !important; =
-webkit-box-flex-group: unset !important; -webkit-box-lines: unset =
!important; -webkit-box-ordinal-group: unset !important; =
-webkit-box-orient: unset !important; -webkit-box-pack: unset =
!important; -webkit-box-reflect: unset !important; -webkit-box-shadow: =
unset !important; -webkit-column-axis: unset !important; =
-webkit-column-progression: unset !important; -webkit-cursor-visibility: =
unset !important; -webkit-font-size-delta: unset !important; =
-webkit-hyphenate-limit-after: unset !important; =
-webkit-hyphenate-limit-before: unset !important; =
-webkit-hyphenate-limit-lines: unset !important; -webkit-initial-letter: =
unset !important; -webkit-line-align: unset !important; =
-webkit-line-box-contain: unset !important; -webkit-line-clamp: unset =
!important; -webkit-line-grid: unset !important; -webkit-line-snap: =
unset !important; -webkit-marquee-direction: unset !important; =
-webkit-marquee-increment: unset !important; -webkit-marquee-repetition: =
unset !important; -webkit-marquee-speed: unset !important; =
-webkit-marquee-style: unset !important; -webkit-mask: unset !important; =
-webkit-mask-composite: unset !important; -webkit-mask-source-type: =
unset !important; -webkit-nbsp-mode: unset !important; =
-webkit-rtl-ordering: unset !important; -webkit-text-combine: unset =
!important; -webkit-text-decorations-in-effect: unset !important; =
-webkit-text-fill-color: unset !important; -webkit-text-security: unset =
!important; -webkit-text-stroke-color: unset !important; =
-webkit-text-stroke-width: unset !important; -webkit-user-drag: unset =
!important; -webkit-user-modify: unset !important; -webkit-user-select: =
unset !important; word-spacing: unset !important; display: block =
!important; visibility: unset !important; opacity: unset !important; =
block-size: unset !important; border-block: unset !important; =
border-radius: unset !important; border-end-end-radius: unset =
!important; border-end-start-radius: unset !important; border-inline: =
unset !important; border-start-end-radius: unset !important; =
border-start-start-radius: unset !important; inset: unset !important; =
contain-intrinsic-block-size: unset !important; contain-intrinsic-size: =
unset !important; contain-intrinsic-inline-size: unset !important; =
height: unset !important; inline-size: unset !important; inset-block: =
unset !important; inset-inline: unset !important; margin-block: unset =
!important; margin-inline: unset !important; max-block-size: unset =
!important; max-height: unset !important; max-inline-size: unset =
!important; max-width: unset !important; min-block-size: unset =
!important; min-height: unset !important; min-inline-size: unset =
!important; min-width: unset !important; overscroll-behavior-block: =
unset !important; overscroll-behavior-inline: unset !important; =
overscroll-behavior: unset !important; padding-block: unset !important; =
padding: unset !important; padding-inline: unset !important; =
scroll-margin-block: unset !important; scroll-margin: unset !important; =
scroll-margin-inline: unset !important; scroll-padding-block: unset =
!important; scroll-padding: unset !important; scroll-padding-inline: =
unset !important; margin: 0px 0px 0px 16px !important; width: =
fit-content !important;"><a id=3D"pfptBanner9lsnwgc" =
href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/AdhS1Rd-!-XFVHHjT_=
UDUGPnaI6Sp28PJha3Fj7n1d8eGOcwOGX-JIw8cne1mSsxjMN0cah24IwMj1Ml-NmKDYP10vjr=
g9ybT2vDnfr5Kjw5vrTMPCEIww0Na7RDdjs_X1Cw$" style=3D"color-scheme: unset =
!important; ruby-position: unset !important; writing-mode: unset =
!important; -webkit-ruby-position: unset !important; color: unset =
!important; font-family: unset !important; font-feature-settings: unset =
!important; font-kerning: unset !important; font-optical-sizing: unset =
!important; font-palette: unset !important; font-size: unset !important; =
font-size-adjust: unset !important; font-stretch: unset !important; =
font-style: unset !important; font-synthesis-small-caps: unset =
!important; font-synthesis-style: unset !important; =
font-synthesis-weight: unset !important; font-variant-alternates: unset =
!important; font-variant-caps: unset !important; =
font-variant-east-asian: unset !important; font-variant-emoji: unset =
!important; font-variant-ligatures: unset !important; =
font-variant-numeric: unset !important; font-variant-position: unset =
!important; font-variation-settings: unset !important; font-weight: =
unset !important; text-orientation: unset !important; text-rendering: =
unset !important; zoom: unset !important; -webkit-font-smoothing: unset =
!important; -webkit-locale: unset !important; -webkit-text-size-adjust: =
unset !important; -webkit-text-zoom: unset !important; letter-spacing: =
unset !important; text-autospace: unset !important; text-spacing-trim: =
unset !important; accent-color: unset !important; place-content: unset =
!important; place-items: unset !important; place-self: unset !important; =
alignment-baseline: unset !important; anchor-name: unset !important; =
animation-composition: unset !important; animation: unset !important; =
animation-timeline: unset !important; appearance: unset !important; =
aspect-ratio: unset !important; backdrop-filter: unset !important; =
backface-visibility: unset !important; background: unset !important; =
background-blend-mode: unset !important; baseline-shift: unset =
!important; line-clamp: unset !important; block-step-insert: unset =
!important; block-step-size: unset !important; border-collapse: unset =
!important; border: unset !important; box-shadow: unset !important; =
box-sizing: unset !important; break-after: unset !important; =
break-before: unset !important; break-inside: unset !important; =
buffered-rendering: unset !important; caption-side: unset !important; =
caret-color: unset !important; clear: unset !important; clip: unset =
!important; clip-path: unset !important; clip-rule: unset !important; =
color-interpolation: unset !important; color-interpolation-filters: =
unset !important; column-count: unset !important; column-fill: unset =
!important; gap: unset !important; column-rule-color: unset !important; =
column-rule-style: unset !important; column-rule-width: unset =
!important; column-span: unset !important; column-width: unset =
!important; contain: unset !important; container-name: unset !important; =
container-type: unset !important; content: unset !important; =
content-visibility: unset !important; counter-increment: unset =
!important; counter-reset: unset !important; counter-set: unset =
!important; cursor: unset !important; cx: unset !important; cy: unset =
!important; d: unset !important; dominant-baseline: unset !important; =
empty-cells: unset !important; field-sizing: unset !important; fill: =
unset !important; fill-opacity: unset !important; fill-rule: unset =
!important; filter: unset !important; flex: unset !important; flex-flow: =
unset !important; float: unset !important; flood-color: unset =
!important; flood-opacity: unset !important; =
glyph-orientation-horizontal: unset !important; =
glyph-orientation-vertical: unset !important; grid: unset !important; =
grid-column-end: unset !important; grid-column-start: unset !important; =
grid-row-end: unset !important; grid-row-start: unset !important; =
hanging-punctuation: unset !important; hyphenate-character: unset =
!important; hyphens: unset !important; image-orientation: unset =
!important; image-rendering: unset !important; input-security: unset =
!important; isolation: unset !important; kerning: unset !important; =
lighting-color: unset !important; line-break: unset !important; =
line-fit-edge: unset !important; line-height: unset !important; =
list-style: unset !important; margin-trim: unset !important; marker: =
unset !important; mask: unset !important; mask-composite: unset =
!important; mask-mode: unset !important; mask-size: unset !important; =
mask-type: unset !important; masonry-auto-flow: unset !important; =
math-style: unset !important; mix-blend-mode: unset !important; =
object-fit: unset !important; object-position: unset !important; =
offset-anchor: unset !important; offset-distance: unset !important; =
offset-path: unset !important; offset-position: unset !important; =
offset-rotate: unset !important; order: unset !important; orphans: unset =
!important; outline: unset !important; outline-offset: unset !important; =
overflow-anchor: unset !important; overflow-wrap: unset !important; =
overflow: unset !important; page: unset !important; paint-order: unset =
!important; perspective: unset !important; perspective-origin: unset =
!important; pointer-events: unset !important; position: unset =
!important; position-anchor: unset !important; print-color-adjust: unset =
!important; quotes: unset !important; r: unset !important; resize: unset =
!important; rotate: unset !important; ruby-align: unset !important; =
ruby-overhang: unset !important; rx: unset !important; ry: unset =
!important; scale: unset !important; scroll-behavior: unset !important; =
scroll-snap-align: unset !important; scroll-snap-stop: unset !important; =
scroll-snap-type: unset !important; scroll-timeline: unset !important; =
scrollbar-color: unset !important; scrollbar-gutter: unset !important; =
scrollbar-width: unset !important; shape-image-threshold: unset =
!important; shape-margin: unset !important; shape-outside: unset =
!important; shape-rendering: unset !important; speak-as: unset =
!important; stop-color: unset !important; stop-opacity: unset =
!important; stroke: unset !important; stroke-color: unset !important; =
stroke-dasharray: unset !important; stroke-dashoffset: unset !important; =
stroke-linecap: unset !important; stroke-linejoin: unset !important; =
stroke-miterlimit: unset !important; stroke-opacity: unset !important; =
stroke-width: unset !important; tab-size: unset !important; =
table-layout: unset !important; text-align: unset !important; =
text-align-last: unset !important; text-anchor: unset !important; =
text-box: unset !important; text-combine-upright: unset !important; =
text-decoration-color: unset !important; text-decoration: unset =
!important; text-decoration-skip-ink: unset !important; =
text-decoration-style: unset !important; text-decoration-thickness: =
unset !important; text-emphasis-color: unset !important; =
text-emphasis-position: unset !important; text-emphasis-style: unset =
!important; text-group-align: unset !important; text-indent: unset =
!important; text-justify: unset !important; text-overflow: unset =
!important; text-shadow: unset !important; text-transform: unset =
!important; text-underline-offset: unset !important; =
text-underline-position: unset !important; text-wrap: unset !important; =
touch-action: unset !important; transform: unset !important; =
transform-box: unset !important; transform-origin: unset !important; =
transform-style: unset !important; transition: unset !important; =
translate: unset !important; vector-effect: unset !important; =
vertical-align: unset !important; view-timeline: unset !important; =
view-transition-class: unset !important; view-transition-name: unset =
!important; white-space: unset !important; widows: unset !important; =
will-change: unset !important; word-break: unset !important; x: unset =
!important; y: unset !important; z-index: unset !important; =
-apple-color-filter: unset !important; -apple-pay-button-style: unset =
!important; -apple-pay-button-type: unset !important; =
-internal-text-autosizing-status: unset !important; =
-webkit-backdrop-filter: unset !important; -webkit-background-clip: =
unset !important; -webkit-background-origin: unset !important; =
border-spacing: unset !important; -webkit-box-align: unset !important; =
-webkit-box-decoration-break: unset !important; -webkit-box-direction: =
unset !important; -webkit-box-flex: unset !important; =
-webkit-box-flex-group: unset !important; -webkit-box-lines: unset =
!important; -webkit-box-ordinal-group: unset !important; =
-webkit-box-orient: unset !important; -webkit-box-pack: unset =
!important; -webkit-box-reflect: unset !important; -webkit-box-shadow: =
unset !important; -webkit-column-axis: unset !important; =
-webkit-column-progression: unset !important; -webkit-cursor-visibility: =
unset !important; -webkit-font-size-delta: unset !important; =
-webkit-hyphenate-limit-after: unset !important; =
-webkit-hyphenate-limit-before: unset !important; =
-webkit-hyphenate-limit-lines: unset !important; -webkit-initial-letter: =
unset !important; -webkit-line-align: unset !important; =
-webkit-line-box-contain: unset !important; -webkit-line-clamp: unset =
!important; -webkit-line-grid: unset !important; -webkit-line-snap: =
unset !important; -webkit-marquee-direction: unset !important; =
-webkit-marquee-increment: unset !important; -webkit-marquee-repetition: =
unset !important; -webkit-marquee-speed: unset !important; =
-webkit-marquee-style: unset !important; -webkit-mask: unset !important; =
-webkit-mask-composite: unset !important; -webkit-mask-source-type: =
unset !important; -webkit-nbsp-mode: unset !important; =
-webkit-rtl-ordering: unset !important; -webkit-text-combine: unset =
!important; -webkit-text-decorations-in-effect: unset !important; =
-webkit-text-fill-color: unset !important; -webkit-text-security: unset =
!important; -webkit-text-stroke-color: unset !important; =
-webkit-text-stroke-width: unset !important; -webkit-user-drag: unset =
!important; -webkit-user-modify: unset !important; -webkit-user-select: =
unset !important; word-spacing: unset !important; display: inline-block =
!important; visibility: unset !important; opacity: unset !important; =
block-size: unset !important; border-block: unset !important; =
border-radius: unset !important; border-end-end-radius: unset =
!important; border-end-start-radius: unset !important; border-inline: =
unset !important; border-start-end-radius: unset !important; =
border-start-start-radius: unset !important; inset: unset !important; =
contain-intrinsic-block-size: unset !important; contain-intrinsic-size: =
unset !important; contain-intrinsic-inline-size: unset !important; =
height: unset !important; inline-size: unset !important; inset-block: =
unset !important; inset-inline: unset !important; margin-block: unset =
!important; margin: unset !important; margin-inline: unset !important; =
max-block-size: unset !important; max-height: unset !important; =
max-inline-size: unset !important; max-width: unset !important; =
min-block-size: unset !important; min-height: unset !important; =
min-inline-size: unset !important; min-width: unset !important; =
overscroll-behavior-block: unset !important; overscroll-behavior-inline: =
unset !important; overscroll-behavior: unset !important; padding-block: =
unset !important; padding: unset !important; padding-inline: unset =
!important; scroll-margin-block: unset !important; scroll-margin: unset =
!important; scroll-margin-inline: unset !important; =
scroll-padding-block: unset !important; scroll-padding: unset =
!important; scroll-padding-inline: unset !important; width: unset =
!important;"><div class=3D"pfptPrimaryButton9lsnwgc" style=3D"border: =
1px solid rgb(102, 102, 102); display: inline-block !important; =
visibility: visible !important; opacity: 1 !important; font-family: =
Arial, sans-serif !important; font-size: 14px !important; font-weight: =
normal !important; text-decoration: none !important; border-radius: 2px =
!important; padding: 7.5px 16px !important; margin: 3px 0px 3px 16px =
!important; white-space: nowrap !important; width: fit-content =
!important;">Report&nbsp;Suspicious</div></a></div><div style=3D"height: =
0px; clear: both !important; display: block !important; visibility: =
hidden !important; line-height: 0 !important; font-size: 0.01px =
!important;"></div></div><div dir=3D"ltr" style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><p style=3D"">Hello Community,&nbsp;</p><p =
style=3D"">I'm proposing an update to the BMC tar image to adopt the =
FIPS 204 (ML-DSA) Post-Quantum Encryption Standards,<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"https://www.nist.gov/news-events/news/2024/08/nist-releases-first-=
3-finalized-post-quantum-encryption-standards">finalized by =
NIST</a><span class=3D"Apple-converted-space">&nbsp;</span>in August =
2024. This update will enhance the security and integrity of the image =
by incorporating a post-quantum resistant signing method using ML-DSA, =
in addition to the existing RSA signing method. The proposed design =
includes the following aspects:</p><ul style=3D""><li>Generating a new =
set of private and public key pairs for ML-DSA</li><li>Updating the =
directory structure to include MLDSA signature files, with a proposed =
structure as =
follows:&nbsp;</li><ul><li>image-rofs.sig&nbsp;</li><li>image-kernel.sig</=
li><li>MANIFEST.sig&nbsp;</li><li>publickey&nbsp;</li><li>MLDSA/&nbsp;</li=
><ul><li>public_key_MLDSA&nbsp;</li><li>image-bmc_MLDSA.sig</li><li>image-=
hostfw_MLDSA.sig</li><li>image-kernel_MLDSA.sig</li><li>image-rofs_MLDSA.s=
ig</li><li>image-rwfs_MLDSA.sig</li><li>image-u-boot_MLDSA.sig</li><li>MAN=
IFEST_MLDSA.sig</li></ul></ul><li>Modifying the image generation process =
to support the new signing method, including updates to generate and =
include MLDSA signature files in the tar archive</li><li>Updating the =
manifest to include MLDSA-related information</li><li>Ensuring backward =
compatibility with existing RSA signing methods to allow for a smooth =
transition to the new ML-DSA signing method. The code update will =
perform ML-DSA verification only if a valid ML-DSA key is found on the =
BMC flash; otherwise, it will skip this check and only perform RSA =
verification. Additionally, if an ML-DSA key is present on the BMC =
flash, an ML-DSA signature is expected to be present in the incoming =
image; if not, the image will be rejected to prevent reverting to =
RSA-only verification by removing ML-DSA signatures from newer =
images.</li><li>Modifying the signature verification process to support =
both RSA and ML-DSA signature validation.</li></ul><div><span =
style=3D""><font face=3D"arial, sans-serif">Please share any feedback or =
suggestions you may have.</font></span><font><span style=3D"caret-color: =
rgb(0, 0, 0);"><br></span></font></div><div><span style=3D""><font =
face=3D"arial, sans-serif"><br></font></span></div><div><span =
style=3D""><font face=3D"arial, sans-serif">Thanks &amp; =
Regards,</font></span></div><div><span style=3D""><font face=3D"arial, =
sans-serif">Jishnu.</font></span></div></div></div></blockquote></div><br>=
</div></div></body></html>=

--Apple-Mail=_81505B47-9B99-49DD-9CE1-FF41AD66341A--

