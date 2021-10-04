Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4F421995
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 00:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZcc11pMz2yms
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 09:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qvjzf1lo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qvjzf1lo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNZc80RWqz2yR8
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 09:08:39 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KaSqJ004167; 
 Mon, 4 Oct 2021 18:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZDWI0d/pOdyeoKVHAu4s5pikvyaVWjW/Q+lom922+Mo=;
 b=Qvjzf1lopGiWMrceNKVSvKMU06NVVn803+TVTkzmsk96Dj8L2H5fWeVHFpThculR5jWn
 dZlnvPK+8mWuuwn5HXC0c2fH/1eevvmDVDc59WEzlgvG8Anx8LD4LW5TtyctrDY4gbwx
 hGhKHlT/yShyH4U8CKC1YR+hu9FsYDCt17v67Ym6wLdAWLWLbBArWwR8wrMNUOmFx9gW
 UF0P7I+ixlw3PH9Q6BnGOksIU6Xi9GqMMPfMMaUmJcijoySdcSqFzIO4mNYvDgszulIy
 Zr5vlYYfzzRqbmnFcGwsdYSXpVYcqF9MZhIo2lXa8E6CSUsIuv31qtsKaG2Xg4T7Bxas 6Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg7dh3skg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 18:08:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194M4OMJ001151;
 Mon, 4 Oct 2021 22:08:35 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3bef2b0xg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 22:08:35 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194M8Xgi459476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 22:08:34 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8931BE053;
 Mon,  4 Oct 2021 22:08:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F9D1BE04F;
 Mon,  4 Oct 2021 22:08:33 +0000 (GMT)
Received: from [9.211.95.54] (unknown [9.211.95.54])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 22:08:33 +0000 (GMT)
Message-ID: <f5c98d79-d78c-bada-592e-fb997e7ecaf7@linux.vnet.ibm.com>
Date: Mon, 4 Oct 2021 15:08:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Security Working Group meeting - Wednesday September 29
Content-Language: en-US
To: Michael Richardson <mcr@sandelman.ca>, Joseph Reynolds <jrey@linux.ibm.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17785.1633384198@localhost>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
In-Reply-To: <17785.1633384198@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vcpOx_xD24dS9Rp2oAcsLdBJPjw4jaKe
X-Proofpoint-GUID: vcpOx_xD24dS9Rp2oAcsLdBJPjw4jaKe
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1011 phishscore=0 mlxlogscore=977 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040147
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/4/2021 14:49, Michael Richardson wrote:
> 
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > Can we use consider SRP (dropped in OpenSSL 3.0 -- why?) or other
>      > implementations such as GnuTLS?
> 
> I meant to add/ask:
> 
> I assume OpenSSL is part of the build process today.
> Would switching to GnuTLS, WolfTLS or MbedTLS really be possible?
> 
> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
> 
Or LibreSSL https://www.libressl.org/

