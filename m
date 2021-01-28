Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC38307C97
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 18:33:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRSHv1fsKzDr5y
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 04:33:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IqD8MJwj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRSH21KdTzDqvN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 04:33:01 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SHWJhV126996
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=sHCuPtJaWFN+2KB6XRoFR3CKJA1ywM1n0PItwHrY7Dk=;
 b=IqD8MJwj69MJwuOZiH9rjcwKHkjd4bMD2IJohyVdbBMCrNGfCJK594Me3nsOEl9V4n4c
 tmwjgPejNWzwVbb+VQxIkE5sFFIWcdnqYbShQVbxUF1WBnGoVKiFQN3M/vNEBivJ9OE1
 lA2LIwOjbI9AyO59vSGoY57fYS3y9QfCHr2HYP/twKChmt3nKHHtoEvhcpMoMbWI94qZ
 JDnY4V8a4p4beiT1rgGEkOdTX84sVeRzCvZw1wMXCNwJc+WuxZN1soRtgb6rkLpIhXnM
 3XtBdY/kE4pMHIWD8uvwkHlAvgkVM8WPiopRTW6yP8FYz0p7eK/hN/RspCD9d+5HourJ uw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c0q3jdqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:32:59 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SHCnG2029070
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 17:32:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 36a4mcb5ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 17:32:58 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SHWvT922282560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 17:32:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0861112063;
 Thu, 28 Jan 2021 17:32:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FA46112062;
 Thu, 28 Jan 2021 17:32:57 +0000 (GMT)
Received: from demeter.local (unknown [9.85.140.134])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Jan 2021 17:32:56 +0000 (GMT)
Subject: Re: Use cases: what interface should admins be allowed to disable?
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, Tom Joseph <tomjose@linux.vnet.ibm.com>
References: <8156dcbe-42d3-76f9-ba41-5998d3da6199@linux.ibm.com>
Message-ID: <80e3b9cf-cd09-f1c7-abd8-69fa12da7e75@linux.ibm.com>
Date: Thu, 28 Jan 2021 11:32:55 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8156dcbe-42d3-76f9-ba41-5998d3da6199@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=605 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280082
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

On 1/13/21 1:23 PM, Joseph Reynolds wrote:
> What network interfaces does your BMC support?  Do you want to allow 
> the BMC admin to disable them?
> Please help provide use cases and guidance.  This is for current work 
> in this area: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006
>
> Discussion:
>
> OpenBMC provides several network interfaces including:
>  - HTTP - either as access to BMCWeb without transport layer security, 
> or as a redirect to HTTPS (pending review)
>  - HTTPS - access to the BMCWeb server
>  - SSH - access to both the BMC's command shell (port 22) and the 
> host's console (port 2200)
>  - IPMI (RAKP)
>  - NTP
>
> See detailed interface discussion here: 
> https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
>
>
> BMCWeb currently implements a Redfish API (ManagerNetworkProtocol) for 
> the BMC admin to enable and disable network interfaces.  This 
> interface is being enhanced by the gerrit review linked above.  We are 
> trying to determine how this should work.

We discussed a direction in the gerrit review.
1. Enhance BMCWeb to be able to enable & disable these interfaces.
2. Enhance the service config manager 
(https://github.com/openbmc/service-config-manager) with a block list, 
so distros can decide which services should remain always-enabled.  For 
example, the default could be that HTTPS is always enabled.

Joseph

>
> I wrote down my preferences here: 
> https://github.com/ibm-openbmc/dev/issues/1763  and I understand 
> others will have different use cases.  So, the purpose of this email 
> is to understand how to move forward.  I also understand some use 
> cases will completely disable various interfaces.  For example, some 
> users may completely remove IPMI functions from the firmware image.
>
> For each interface, I see three possible configurations:
> 1. The interface is not present in the image.  Naturally, the admin 
> shall have no way to enable this interface (because it is not 
> present).  For example, we want IPMI eventually to be configured out 
> of the image.
> 2. The interface is present in the image but the admin shall have no 
> way to disable it.  For example, SSH is present and the admin has no 
> API to disable it.  Another example, disabling HTTPS would prevent 
> Redfish access, and then the admin may lock themselves out of the 
> BMC.  This is not a desirable situation.
> 3. The interface is present in the image and the admin shall have a 
> way to enable and disable it.  For example, this capability already 
> exists in BMCWeb for IPMI and NTP.  The case for SSH is discussed in 
> issue 1763 linked above.
>
> How can these configurations be implemented?
> 1. When the interface is not present in the image -- Write bitbake 
> recipes to configure/build the feature out of the image, and also 
> configure BMCWeb so it cannot enable/disable that interface.
> 2. When the interface is present and should always remain enabled -- 
> Configure BMCWeb so it cannot enable/disable the interface.
> 3. When the interface is present and the admin shall have a way to 
> enable and disable it -- First, if needed, enhance the BMCWeb Redfish 
> API to allow the admin to enable and disable the interface. Then 
> configure BMCWeb to allow that.
>
> I propose project defaults as follows:
>  - HTTP - interface present and redirects to HTTP / admin allowed to 
> enable and disable.
>  - HTTPS - always enabled (the admin is not allowed to disable it)
>  - SSH - present in the image & admin allowed to enable and disable
>  - IPMI - present in the image & admin allowed to enable and disable
>  - NTP - present in the image & admin allowed to enable and disable
>
> Oops, I wrote too much!  Feedback here or in the gerrit review is 
> appreciated.
>
> - Joseph
>

