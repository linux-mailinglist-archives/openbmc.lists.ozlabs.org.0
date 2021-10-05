Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72422422B7C
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 16:50:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP0r723dxz2ygF
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 01:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/ndhoz5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j/ndhoz5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP0qg3vh7z2yK6
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 01:50:06 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195EBn7n012742; 
 Tue, 5 Oct 2021 10:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/v6Gk5qIg59hLAmHgzeu8aqAfXG7UPCzRL+C+QFOCSc=;
 b=j/ndhoz50dk53fxEOFFeBFUeDBWrK+csPYr4C1f6uSoKQHEGbXWQ76ONVPg9KBjKBbT4
 zpo2ixWAeW9n6ymB4Z3cEh3mIVmuavtyk5nKyYHPdG8r8mPSa29pJvy4DuPL4Jcd2BTM
 kwHkigtRpBBEPhOt7CwpwykNTgQAZyxbLQoNWV0P6p695lEvp6bNQGmh4148tkqEXR0y
 9cgYfw4DJyPVrmOQkOWqcgiaS+rVECCJmSqN6A2ylMyFDZPm9/aQ9cPPVX9B5uo/LLw3
 5LmhtbywOj7DNCqmNAuqqNRZYtVz7tO8WV2bOm/J4tj5ufrnzlgGtYIuXlFvaRs095GS dw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bgr8g13jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 10:50:04 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195Em5GI031943;
 Tue, 5 Oct 2021 14:50:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3bef2d2rsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 14:50:03 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195Eo2Wp51380604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 14:50:02 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2142DB2066;
 Tue,  5 Oct 2021 14:50:02 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06ECB206E;
 Tue,  5 Oct 2021 14:50:01 +0000 (GMT)
Received: from demeter.local (unknown [9.65.67.179])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  5 Oct 2021 14:50:01 +0000 (GMT)
Subject: Re: SPAKE, DTLS and passwords
To: Michael Richardson <mcr@sandelman.ca>, openbmc <openbmc@lists.ozlabs.org>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
 <17277.1633384075@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <edfa6abd-e2a2-00ca-3154-59fee4ae125f@linux.ibm.com>
Date: Tue, 5 Oct 2021 09:50:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <17277.1633384075@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G4sTBEzbw3TFwhl0gQROQgFsD-ITcj8y
X-Proofpoint-GUID: G4sTBEzbw3TFwhl0gQROQgFsD-ITcj8y
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_02,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=689 clxscore=1011 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050086
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



On 10/4/21 4:47 PM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > The planned IPMI over DLTS function will have certificate-based
>      > authuentication.
>
> Do you mean that the server will be authenticated with a certificate, or that
> it will use mutual authentication?

I understand this means mutual-TLS.
Based on the gerrit design: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548/4/designs/ipmi-over-dtls.md

Note that design also says the server will have an identity certificate; 
same as the HTTPS certificate described in 
https://github.com/openbmc/bmcweb/blob/master/README.md

Joseph

...snip...

> --
> ]               Never tell me the odds!                 | ipv6 mesh networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [
>
>
>
>

