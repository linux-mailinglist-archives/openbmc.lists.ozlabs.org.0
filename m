Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C84BEB80
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 21:00:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Y7s1JW1z3bbn
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 07:00:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y8BKdLbJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y8BKdLbJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2Y7P6PWWz2xrG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 07:00:17 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LIidOf000426; 
 Mon, 21 Feb 2022 20:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mh9U2lESdrs5a9IvvzaoDYB2KkIaKhwEb3JoAHfgaUs=;
 b=Y8BKdLbJqJG8tPm711RBnYOR8eT92PVG6xungp4PVFKe/lNXr8GtChKGxK3VHn1TbeiL
 PhHaFDr0bGt8HrP3SfYA+1j+mMwY7qdMQRejzQBG+LmM8/+m7mB9zc/vNZS43P8EMf7s
 NUXU1BiiUPsdW4poYhFE6w1Y8UGxxqnNruA+5R+WfSc4sVuVHcqF1H3W+ockUW7Af8dU
 gYfh1As+mKzNwqt4elsBQ3NRRSoGL16i1QahFDNH3OP6c5lUpmPqKd4daDikrowYiKyF
 bOGjdD6W6ObaF/mh0gWqR9YK0XLd74RZDlDV2QINkTCJnhFHs6ST715mBkH2aRa4VHC+ 1A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ecg9n9d6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 20:00:13 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21LJx4Zi014113;
 Mon, 21 Feb 2022 20:00:12 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 3ear69nc5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 20:00:12 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21LK0BW724052156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 20:00:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB423C6065;
 Mon, 21 Feb 2022 20:00:11 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50AC5C6059;
 Mon, 21 Feb 2022 20:00:11 +0000 (GMT)
Received: from [9.160.10.23] (unknown [9.160.10.23])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 21 Feb 2022 20:00:11 +0000 (GMT)
Message-ID: <762e2959-ddb1-c075-a581-756cc4c9d791@linux.ibm.com>
Date: Mon, 21 Feb 2022 14:00:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: service-config-manager performance issue
Content-Language: en-US
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, openbmc@lists.ozlabs.org
References: <a9db0239-a53a-9a6f-e167-335dc8e56872@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <a9db0239-a53a-9a6f-e167-335dc8e56872@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BX7XnK804x7THPqxj3y7xUiCfAIm_l-J
X-Proofpoint-ORIG-GUID: BX7XnK804x7THPqxj3y7xUiCfAIm_l-J
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_09,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 mlxlogscore=945 phishscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210116
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
Cc: apparao.puli@linux.intel.com, richard.marian.thomaiyar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/21/22 6:41 AM, Jiaqing Zhao wrote:
> Hi, all
>
> When updating service status with service-config-manager, it always takes ~15s for the new status to be applied, which is much longer than it should be.
>
> By inspecting the code, I found there is a 15s wait before updating service status in ServiceConfig::startServiceRestartTimer(). (https://github.com/openbmc/service-config-manager/blob/f2744893b77b9dd8903bb13113f4c3ef62c18f04/src/srvcfg_manager.cpp#L382)
>
> The 15s-wait is added at first in commit 0084047 (https://github.com/openbmc/service-config-manager/commit/0084047d008fd0ac36f09a232f67ff2fc5314b53).

Here at IBM we are seeing the same thing.  It looks like that code 
(https://github.com/openbmc/service-config-manager/blob/master/src/srvcfg_manager.cpp 
- ServiceConfig::startServiceRestartTimer) was part of the initial 
commit.  I wonder if the problem is caused by a bug in that code.  (But 
I am not familiar with the code, and I don't have time to look at it 
now.)  Is the intention to reload the systemd units but give up after 15 
seconds?

Joseph

> I've tested service-config-manager works as expected with the wait removed, and it only takes ~1s for the settings being applied, shall we remove it? And I'd like to ask what is the purpose of this wait to double confirm if removing it will bring any side effect.
>
> Thanks,
> Jiaqing

