Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBC24A9C8
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 01:02:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX3GN0DhpzDr6q
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 09:02:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J5n1HTtC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX32k0dpYzDqyl
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 08:52:45 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JMXEFk067954
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 18:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=py3Is4X6VkpUOMG9DbgnXcx3FCZ4Nv8tBnFxQYSsFKk=;
 b=J5n1HTtCs47nNdjK+iO7y8UOVc/85rQnkPUILdzjTU0PvlojafgGG/gqWZV/briounXx
 zqqNDCxis9hX/yST7BniKfM9rDhj6oaN8NwE4u5EWrbeZq+lH5fyBo/TiZRpHSJ2mLNl
 58KdmfXKfQzvfpIeJd+fKhaHebLONAqYpUQzNIaIC03N/ULNildOSqOxOYMUtDvh2f3C
 vJGeMJ9ljWaR5UFWcOjgzbRKNyDDLXy7hIuompU9U6zGJnd+N1c6WzJtsXqUutibRLkr
 Xo/tg55MsFyoJKmy5Y0+XykmORsWhsgsb0YlXIAj2JwX15jd7CPinP1CdDyGqJ/MJZmP +A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 330ww9my9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 18:52:43 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 19 Aug 2020 22:52:43 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 19 Aug 2020 22:52:41 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020081922524036-862670 ;
 Wed, 19 Aug 2020 22:52:40 +0000 
In-Reply-To: <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
Subject: Re: GUI Design Workgroup - BMCWeb login change
From: "Derick Montague" <Derick.Montague@ibm.com>
To: jrey@linux.ibm.com
Date: Wed, 19 Aug 2020 22:52:40 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <6fd33e23-9845-ed74-7784-75a3a1439f1f@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 22755
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20081922-8889-0000-0000-00000358AAAC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.188826
X-IBM-SpamModules-Versions: BY=3.00013680; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01422536; UDB=6.00763342; IPR=6.01205220; 
 MB=3.00033608; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-19 22:52:42
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-19 16:08:07 - 6.00011743
x-cbparentid: 20081922-8890-0000-0000-0000ACFEB3EB
Message-Id: <OFB642107F.4E5E7CE6-ON002585C9.007D46F4-002585C9.007DAC18@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Derick, the "BMCWeb login change" [1] also came up in the security
> working group meeting.  Folks were interested in getting the questions
> answered rather more quickly.
=20
> What is the best way to resolve the issues?  Email?  Video conference?=20
> IRC chat?  Or continue with the gerrit review?

That is a great question for the community. We are trying to find a way to
accommodate this WITHOUT having to manage the login page in BMC Web. Maybe
we can gather a list of people that are interested and set up a Webex=20
discussion. We should probably post the question in IRC also to make the=20
request a bit broader than email.
=20

