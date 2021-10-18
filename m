Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B260743268A
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 20:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY5FD2SL1z3053
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 05:36:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RxwgH+jK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RxwgH+jK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY5Dk6gHvz2ynb
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 05:36:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IGfCY9000459; 
 Mon, 18 Oct 2021 14:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kb+EEXMWpQiSYrdFd5Y+LOu1nMYVsOd9l90bEe+o4nY=;
 b=RxwgH+jKyToYsVd5OdNHtUOtn1dKMP6NMwT5zY04S9kN6g2Z1uD/nRqqev1NuZkm/P8b
 Oph+7buOhXSyPAcL5n6KZAKCvjs22J5+k7DcIWEP4wS/of9QZpr8q1tJWunQBeGeZxO+
 Kpr7LNnsyez6dIjP1J8fSAS4HXuPrZjFSCn2nArKkFrAZyAlrurpHQGTw/cXeb2rq1qt
 OpUXYrWFVAq2ciiwrkKHlv9e3f9J172v7t3MkWvv/1QfyFQDsxmRbCViqOElCRVJEdTy
 yC1e07XG2vvW+wuGp9ByuOxD0c37g4AFox1MQzcoSbdiZgQETmq7IToDM6heIvZQoKpT xw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bs8vm10f7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 14:36:11 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IIRwTI009009;
 Mon, 18 Oct 2021 18:36:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3bqpcad2m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 18:36:10 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IIaAdv34865510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 18:36:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4887B112067;
 Mon, 18 Oct 2021 18:36:10 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D23AB112064;
 Mon, 18 Oct 2021 18:36:09 +0000 (GMT)
Received: from [9.163.19.199] (unknown [9.163.19.199])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 18:36:09 +0000 (GMT)
Message-ID: <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
Date: Mon, 18 Oct 2021 11:36:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Control and uses of USB for BMC's own internal uses
Content-Language: en-US
To: openbmc@lists.ozlabs.org, richard.marian.thomaiyar@linux.intel.com,
 apparao.puli@linux.intel.com, patrick@stwcx.xyz
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
In-Reply-To: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FQbs5iAj-93P5RFO3aTzEGotIqYoR-5s
X-Proofpoint-ORIG-GUID: FQbs5iAj-93P5RFO3aTzEGotIqYoR-5s
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=516 bulkscore=0 clxscore=1011 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180103
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

On 10/17/2021 11:55, Bruce Mitchell wrote:
> This thread BMC's USB means for the BMC's own uses
> not for Host's uses nor to provide services to the
> Host.  Thus, if I said "Disable the BMC's USB" that
> would not impact the Host in any fashion.
> 
> I need to be able to control the BMC's USB ports
> to prevent BMC uses of USB Pen Drive updates and
> independently prevent the BMC uses of USB serial
> cable for UPS.  As well as re-enable those usages.
> 
> Clearly in this Gerrit review the term Disabled was
> not defined.  47180: bmc-usb: property to track usb state
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180 
> 
> 
> Also, since this is related to security of the BMC
> my intent was to offer the users a clear way to
> achieve the control of the BMC's USB ports without
> the users needing to know any of the Servers' USB
> topology.  I personally find complicated user options
> for features adds risk to the system security.
> 
> A recommendation I have receive is to use phosphor-state-manager.
> 
> Also, from what I have observed this control of the
> BMC's USB ports may be unique to my company (IBM).
> And thus, an OEM solution may be best.
> 
> Does anyone else have a need or desire to control the
> BMC's USB ports?

Also suggested utilize https://github.com/openbmc/service-config-manager 
to disable/enable the service and make it like enable/disable SSH
via Redfish via bmcweb
