Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 011351B669E
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 00:06:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Wc72fLQzDr3t
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 08:06:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497WbQ0F3BzDqYJ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 08:06:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NM2YBQ063901
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 18:06:06 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc68rwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 18:06:06 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 23 Apr 2020 22:06:05 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 23 Apr 2020 22:06:01 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2020042322055895-968406 ;
 Thu, 23 Apr 2020 22:05:58 +0000 
In-Reply-To: <3238f1802a0646cfab824a7a83fd7759@SCL-EXCHMB-13.phoenix.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Date: Thu, 23 Apr 2020 22:05:59 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3238f1802a0646cfab824a7a83fd7759@SCL-EXCHMB-13.phoenix.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 38447
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20042322-6875-0000-0000-000002632BB5
X-IBM-SpamModules-Scores: BY=0.283579; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.082518
X-IBM-SpamModules-Versions: BY=3.00012960; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01366792; UDB=6.00730001; IPR=6.01149147; 
 MB=3.00031843; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-23 22:06:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-23 20:16:03 - 6.00011278
x-cbparentid: 20042322-6876-0000-0000-000022DA6FD7
Message-Id: <OF270324DB.AB2D97B1-ON00258553.007753F9-00258553.007965EF@notes.na.collabserv.com>
Subject: Re: Remove default private image signing key from openbmc [was:
 Security Working Group meeting - Wednesday April 15 - results]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_17:2020-04-23,
 2020-04-23 signatures=0
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On April 23, 2020 about 14:11 in some timezone, Bruce Mitchell wrote:

>How does OpenBMC keep the publickey, that is generated from the
>private image signing key (i.e. OpenBMC.priv),  in the SPI image and
>in the upgrade files?

The upgrade files are a tarball, and the MANIFEST include the image=20
type and key.

https://github.com/openbmc/docs/blob/master/code-update/code-update.md#step=
s-to-update

Also, fit images (containg the kernel, device-tree, and any initrd)=20
can be signed; see=20

https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/doc/uImage.F=
IT/signature.txt


The code management app locates the key, see the answer to the=20
next question.


There is also an effort to design some kind of image security=20
for the upcoming eMMC support.  The current strawman is to=20
use dm-verity with the signature stored in boot-config signed=20
into the FIT with the initrd.

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28443




>Also how does OpenBMC verify that upgrade images are properly signed?

The bmc code management application, which provides the D-bus=20
endpoint, impments verifing the image. =20

https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/master/image=5Fverif=
y.cpp

There is similar code for the host images depending on the platform.=20
For example OpenPower systems use openpower-pnor-code-mgmt.

https://github.com/openbmc/openpower-pnor-code-mgmt/blob/master/image=5Fver=
ify.cpp


>Is there a document describing how all of this works that I have yet>to fi=
nd?

https://github.com/openbmc/docs/blob/master/code-update/code-update-diagram=
s.md




>> Subject: Re: Security Working Group meeting - Wednesday April 15 -
>> results
>>=20
>> On 4/14/20 4:57 PM, Joseph Reynolds wrote:
>> > This is a reminder of the OpenBMC Security Working Group meeting
>> > scheduled for this Wednesday April 15 at 10:00am PDT.
...
>> > The current topics:
>> >
>> > 1. Remove default private image signing key from openbmc
>>=20
>> The leading idea is to disable the recipe that signs the image, but
>> leave the private signing key in the source tree.  Then someone who
>> builds will get an unsigned image.  If they enable the image
>> signing
>> recipe or use it as an example, they will hopefully see the
>> instructions
>> that say to use their own key pair.
>>=20
>> Note that an unsigned image is a good starting point for build
>> processes
>> that use a separate image signing step, such as when the image is
>> signed
>> by a hardware security module (HSM).  One difficulty with this
>> approach
>> is that the public key needs to be put into the BMC's root file
>> system.
>>=20

>> > 2. Discuss issues from the =E2=80=9Cipmi password storage=E2=80=9D ema=
il thread.
>>=20
>> We pretty much re-hashed the ideas from the email thread with no
>> conclusions.
>> One more idea was added, that we can the BMC's TPM to hold the
>> RMCP+
>> keys.
>>=20
>> >
>> > 3. Which algorithm should sign OpenBMC images?
>>=20
>> The answer will vary between projects that are downstream from
>> OpenBMC.
>> We'll keep the default as RSA-SHA256.  Going forward, the plan is:
>> the
>> OpenBMC release process will give visibility to this and other
>> ciphers per:

The MANIFEST includes the key signing type.

>>=20
>>=20
>> 4. Use the Yocto cvecheck vulnerability scan for OpenBMC repos No
>> CVE
>> checking is done at the project-level, but similar check are being
>> done
>> in projects that are downstream from OpenBMC. The idea is a nightly
>> Jenkins job to generate a report of all the unfixed
>> vulnerabilities,
>> something like: bitbake -c cvecheck obmc-phosphor-image.


milton

