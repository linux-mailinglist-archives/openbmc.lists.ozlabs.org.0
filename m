Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBB42AAD4
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 19:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTN4q2frkz2yfk
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 04:31:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g2Xlh0FB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g2Xlh0FB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTN4M2pNKz2yJ5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 04:31:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CHKO41020042; 
 Tue, 12 Oct 2021 13:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HVa0B9SqrAdsBGfY6NfLixvhhoHk4jJ9kAVuKcQimGs=;
 b=g2Xlh0FBuLPfQP04XKu7eGiVzfUkPssivPp/+8mjzWE6L21STr6TfbWCrics88Gk2eCp
 F0fe2QiHkqnQQr5Ywe8Ayb9BZpqzUqg94rL3QH9WdeKvmNVIw9S1Go1bQyYfxpcjhAZi
 qw3xmavzL+gdgZlUkA7FuaN3BByhqfo9JKCJaFX/90WzSDj44kMOBf36FkIQ4qPEzJX7
 u+VEvD8lPJOUA/o1zxZgnMlh6SYnw701SeE9bI6vDp+lURdzyBa1C19yXHRHEDyHXbiQ
 vz4LaeJ+f6p75ate1rcsEx3EQCEf5s2+SVmBxghLuzie2f5SXMvUnGPVBGaAKFmvsJ1u 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bncqubkxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 13:31:04 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CHUA9P017717;
 Tue, 12 Oct 2021 13:31:03 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bncqubkxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 13:31:03 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CHHOGC030552;
 Tue, 12 Oct 2021 17:31:03 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3bk2qbx3ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 17:31:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19CHV18p46662010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 17:31:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C0AC6072;
 Tue, 12 Oct 2021 17:31:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61F72C6067;
 Tue, 12 Oct 2021 17:31:01 +0000 (GMT)
Received: from [9.211.105.168] (unknown [9.211.105.168])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 17:31:01 +0000 (GMT)
Subject: Re: Etag support in openbmc
To: "Zhang, ShuoX" <shuox.zhang@intel.com>, John Broadbent <jebr@google.com>, 
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
 <CAPw1Ef8fKL_cE=absnX-QwMBVckKy5vkffC08ox5ogPt46aUSw@mail.gmail.com>
 <DM5PR11MB154720B60C84C20E395ACBB2E2B69@DM5PR11MB1547.namprd11.prod.outlook.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <6fd6fe09-7fb9-43c7-591b-fee5ed94c20c@linux.vnet.ibm.com>
Date: Tue, 12 Oct 2021 11:30:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DM5PR11MB154720B60C84C20E395ACBB2E2B69@DM5PR11MB1547.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uRVbF5RKn5ZrCfxWWW6orJtXwiH5ozlE
X-Proofpoint-ORIG-GUID: xkLQOZd3uvyRN2BJ2iU4XQafhNWy0TUe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_04,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120095
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

> On Mon, Oct 11, 2021 at 8:37 PM John Broadbent <jebr@google.com 
> <mailto:jebr@google.com>> wrote:
> 
>     I don't think bmcweb support etags. I have never seen logic from
>     them and Ed made a comment about how bmcweb will have to support
>     them in the future here
>     https://github.com/openbmc/webui-vue/issues/43#issue-728321615
>     <https://github.com/openbmc/webui-vue/issues/43#issue-728321615>
> 

Yes, we don't currently support etag. As mentioned in
https://lists.ozlabs.org/pipermail/openbmc/2021-September/027406.html
if you plan to add, we will want to make sure we do this correctly.

Thanks,
Gunnar

