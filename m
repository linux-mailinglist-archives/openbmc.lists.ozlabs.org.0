Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECBC429946
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 00:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSt5P1DcQz2yYS
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 09:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mERCAQ/+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mERCAQ/+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSt506Gycz2yMH
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 09:00:04 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BKfhsa002292
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 18:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 subject : message-id : date : to : content-transfer-encoding :
 mime-version; s=pp1; bh=GfgGbPV608JxStEGPHZg1QacBsLsIXLN5meMX2Og9Ow=;
 b=mERCAQ/+AsygmFU5BCRcooaRC4vkJ3kZzqMcPyojfkIhuqX+BLX/iOw53DP0ud0JAfdW
 dLwqH63TCiMpGAGakbrg8w1lIS0ZNEih9YpaYUhZGUVnunRPRGSKbDms+8lSLlGjqZbi
 CZEiqfBKe6D6qIaO+RfLS3pUDhRhmgEmPQZ4bSE530b/o9ba97Y+48IE5k3+a/3Iv7aP
 Y3/ReHTbWCxJv4v8Yi33InRe+Wh7J3HXyXbe68zpYt5L6Jr6SUgPK8vYNUNAfy0wLQfl
 7fdBFghtwCxiQOU09QXAky7F/3G3S2oMRICNcqYC9b8A3j/qxfrTMQo4ju1ys+y/kv14 8Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmqhy0b9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 18:00:02 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BLvGAe015101
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3bk2q9xvu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19BM00RV29360620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7122124058
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A2C7124053
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.123.215])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 22:00:00 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Subject: Changing the os-release BUILD_ID back to its default value of DATETIME
Message-Id: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
Date: Mon, 11 Oct 2021 16:59:59 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OrYktk7chdNC7LJMbrBhqFhs23XrbFhN
X-Proofpoint-ORIG-GUID: OrYktk7chdNC7LJMbrBhqFhs23XrbFhN
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_10,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110119
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

Hi,

There has been some discussion in Discord on how to work around the "Same v=
ersion" limitation during fw updates, and having a timestamp field that cou=
ld be used to generate a different version id (commit id plus timestamp fie=
ld) for every build seemed had positive support in the discussion.
Also at IBM we were looking for a field that could display the date of a bu=
ild, such as the release or general availability date.

Looking at the BUILD_ID description[1]:

BUILD_ID=3D
A string uniquely identifying the system image originally used as the insta=
llation base. In most cases, VERSION_ID or IMAGE_ID+IMAGE_VERSION are updat=
ed when the entire system image is replaced during an update. BUILD_ID may =
be used in distributions where the original installation image version is i=
mportant: VERSION_ID would change during incremental system updates, but BU=
ILD_ID would not. This field is optional.
Examples: "BUILD_ID=3D"2013-03-20.3"", "BUILD_ID=3D201303203".

The yocto recipe for os-release sets BUILD_ID to DATETIME by default[2].

At the beginning of time, the BUILD_ID in openbmc was set to have the conte=
nts of git describe[3]. Its contents now are the same as VERSION so we have=
 duplicate information:
VERSION=3D"2.11.0-dev"
VERSION_ID=3D2.11.0-dev-566-g263df7f852
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)=
 2.11.0-dev"
BUILD_ID=3D"2.11.0-dev"

If we let the default DATETIME value be built, it'd show in this format:
BUILD_ID=3D"20211007135305"

To re-generate the same image, BUILD_ID can be determined from the image fi=
le names, such as:
obmc-phosphor-image-p10bmc-20211007135305.ext4.mmc.tar

Then BUILD_ID can be set in the conf file, and the image for that timestamp=
 can be built.

Also individual meta layers can choose to set BUILD_ID to any date that the=
y seem relevant for their releases.

Any opinions on changing BUILD_ID to its yocto default of being a timestamp?


1. https://www.freedesktop.org/software/systemd/man/os-release.html#BUILD_I=
D=3D
2. https://github.com/openbmc/openbmc/blob/3fc98fdca6aa7512a4656bec7422f557=
c8e17555/poky/meta/recipes-core/os-release/os-release.bb#L23
3. https://github.com/openbmc/openbmc/pull/78=
