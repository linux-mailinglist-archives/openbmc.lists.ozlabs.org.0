Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 422401A8899
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 20:07:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491tkM278NzDqwt
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 04:07:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491tj14T0fzDqwp
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 04:06:27 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EI6E4r123523
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 14:06:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30b6sgdx6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 14:06:19 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 14 Apr 2020 18:04:41 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 14 Apr 2020 18:04:38 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020041418043721-664928 ;
 Tue, 14 Apr 2020 18:04:37 +0000 
In-Reply-To: <20200413230015.GB9295@mauery.jf.intel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Date: Tue, 14 Apr 2020 18:04:36 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200413230015.GB9295@mauery.jf.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 839
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20041418-1639-0000-0000-000001D27A9F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.006015
X-IBM-SpamModules-Versions: BY=3.00012911; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01362413; UDB=6.00727402; IPR=6.01144779; 
 MB=3.00031697; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-14 18:04:39
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-14 16:37:25 - 6.00011241
x-cbparentid: 20041418-1640-0000-0000-000057C07F59
Message-Id: <OFED1A87B9.D16D66BD-ON0025854A.004EDFC4-0025854A.00634C8E@notes.na.collabserv.com>
Subject: Re:  ipmi password storage
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_09:2020-04-14,
 2020-04-14 signatures=0
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Apr 13, 2020 around 6:01PM in some time zone, Vernon Mauery wrote:
>
>Internally, an issue was raised that basically says that the
>mechanism=20
>by which we are storing the IPMI passwords on the BMC is
>insufficiently=20
>obfuscated. I have come up with a patch set that resolves this at the
>
>expense of no downgrading the BMC without the side-effect of losing
>all=20
>IPMI passwords. I would like to know what the community thinks about=20
>usability vs. security in this scenario.

...

>The migration from the old mechanism to the new could be done simply>by=20
>using the new key on the next write to the /etc/ipmi=5Fpass file. After
>a=20
>firmware update to this new code, a password change would trigger a=20
>decrypt of the /etc/ipmi=5Fpass file, a modification of the plain text,
>
>and a re-encryption of the data. If it reads the 'legacy' key in and=20
>writes out the data using the new key mechanism and deletes the
>legacy=20
>key, it would use the new key mechanism from that point onward.
>However,=20
>this would cause any downgrades to prior versions to fail to decrypt
>the=20
>/etc/ipmi=5Fpass file, thereby losing all the ipmi passwords. This is
>not=20
>ideal, but could possibly be mitigating by truncating the new
>machine-id=20
>derivative password to 8 bytes and storing it in the /etc/key=5Ffile=20
>instead of just deleting it. This might improve security only
>slightly=20
>at for the price of a better user experience.
>

I'll point out the code to handle the new password could be added=20
before the cdoe to use the new method, allowing test and revert=20
until the users are upgraded to the new method.  It does require=20
both methods to be supported.

I didn't follow why currently all openbmc systems end up with
the same encryption^Wobsfucation for what that is worth.

>I know that some companies using OpenBMC have products with users out>in=20
>the field, so it is not great to make changes like this. Also, it is
>not=20
>great to have low-grade security. So here I am, writing to ask for=20
>opinions and options.
>
>--Vernon

Milton

