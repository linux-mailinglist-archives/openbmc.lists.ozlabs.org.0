Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE6430B9A
	for <lists+openbmc@lfdr.de>; Sun, 17 Oct 2021 20:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXTjM1XJpz2ynK
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 05:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MoyzS4lx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MoyzS4lx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXThr5w5rz2ybD
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 05:55:07 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19HFNxUQ004815
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 14:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=6JR8dO06GKlYfnYtspkY6/01ns1uJBBO14lyzet/DIw=;
 b=MoyzS4lxtomgNxcmtjy+2SIBkRJ9J6ITVakzJ0AeIFooD6umpejoCGUk9ehAfDG95KhC
 +l+fHGAfNMsQqjDQG3Bx5frwdi8dBur6WX/HF/13hf6eS8yPSx6k1EEds1M9Gk/sA1Yi
 MhkILvEpruKkIOXVK9Q7xVCHfzyuu2ZOGVXhxbqdWbte3wXHQUYTNmCK85HB/tPdiJcL
 CIZCU7d7ZMLyTacvEOequRrklLrGNZYwyBNGESq1yKoo1xk00B8/dFUzLzKJa226qdd7
 Fm1Q5iD0JhoYNHV1GP/M7J9VYtpsQwqtMA3eVQi7JwGhDUiaPQAfZ+hVbe2x5xbh5uUM MA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3brpe9jkfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 14:55:02 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19HIltFQ024877
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3bqpc9s976-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19HIt1PS30736640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E86F5112061
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE735112062
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:00 +0000 (GMT)
Received: from [9.163.19.199] (unknown [9.163.19.199])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Sun, 17 Oct 2021 18:55:00 +0000 (GMT)
Message-ID: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
Date: Sun, 17 Oct 2021 11:55:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Subject: Control and uses of USB for BMC's own internal uses
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0OYjOzyGqDQv0jzlIIKB7lcJONlwei-E
X-Proofpoint-ORIG-GUID: 0OYjOzyGqDQv0jzlIIKB7lcJONlwei-E
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-17_05,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=7 priorityscore=1501 mlxlogscore=256 phishscore=0 suspectscore=0
 lowpriorityscore=7 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110170124
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

This thread BMC's USB means for the BMC's own uses
not for Host's uses nor to provide services to the
Host.  Thus, if I said "Disable the BMC's USB" that
would not impact the Host in any fashion.

I need to be able to control the BMC's USB ports
to prevent BMC uses of USB Pen Drive updates and
independently prevent the BMC uses of USB serial
cable for UPS.  As well as re-enable those usages.

Clearly in this Gerrit review the term Disabled was
not defined.  47180: bmc-usb: property to track usb state
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180

Also, since this is related to security of the BMC
my intent was to offer the users a clear way to
achieve the control of the BMC's USB ports without
the users needing to know any of the Servers' USB
topology.  I personally find complicated user options
for features adds risk to the system security.

A recommendation I have receive is to use phosphor-state-manager.

Also, from what I have observed this control of the
BMC's USB ports may be unique to my company (IBM).
And thus, an OEM solution may be best.

Does anyone else have a need or desire to control the
BMC's USB ports?
