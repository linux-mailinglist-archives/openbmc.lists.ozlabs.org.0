Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C555251EA3
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 19:51:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbc3t4kZCzDqWX
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 03:51:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dxsZyZL6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbc2y1gp7zDqWX
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 03:50:11 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PHW27I104380; Tue, 25 Aug 2020 13:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uAtFSHhB91OiSbjCo84scUXhhW+4DSKTJABmlTn3QC8=;
 b=dxsZyZL62pr2/VYcdYYB4u+rp6lC3DaJHCRwzXc7tKdpBbHUu07Cg57okSO/79AcGMkd
 YRhd1AkYNQWeRvYDaojG8w8PlS+Lc5XT5qkvBQ3kUfsFHvuqoUaHrg2TBsVezBEYW5ld
 kOW2PN5ljfPCbEkpXDb5s3sjb9eLVh0zS2GIBkRTlUC/WvEnYE07dqAy5NEhpPn5EPAh
 GEFIMXe0VVzgb1/x4cJOfWY0jaZIl+n8f2CffW0Ho5LUXcUrpVFLrg6oVQBKyM8//9gf
 GvL/TnEz4QI1EjHUZwOvhYfCDoz7TKM55dLmvrv63O1c1h1Iodg6w400nGc0DeJ9G91C 1w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3353trywjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:50:08 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PHgs43023945;
 Tue, 25 Aug 2020 17:50:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 332ujekd72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 17:50:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PHo4cJ6423176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 17:50:04 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40FF3BE051;
 Tue, 25 Aug 2020 17:50:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02561BE04F;
 Tue, 25 Aug 2020 17:50:06 +0000 (GMT)
Received: from [9.211.122.48] (unknown [9.211.122.48])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 17:50:06 +0000 (GMT)
Subject: Re: sdbusplus - const/readonly flags
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC List <openbmc@lists.ozlabs.org>
References: <20200825150028.GK3532@heinlein>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <fb22f956-19df-b44f-5ae9-113f6443c2e9@linux.ibm.com>
Date: Tue, 25 Aug 2020 12:50:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825150028.GK3532@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_08:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250129
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

On 8/25/20 10:00 AM, Patrick Williams wrote:
> Hello,
>
> I thought I sent an email to the list on this 1.5 months ago, but I
> didn't receive any feedback.  It seems like my email never made it to
> the list.  So, here is another attempt.
>
> ---
>
>
> TL;DR: The sdbus++ attribute flag 'const' was incorrectly documented and a
> new flag 'readonly' is now available.  Some phosphor-dbus-interfaces
> might be implemented incorrectly.
>
>
> ALSO: I could really use the help of the domain experts for the
> phosphor-dbus-interfaces listed in the gist[4] to review and determine
> if 'const' or 'readonly' is more appropriate.

 From the info you provided, sounds like the ThermalMode interface's 
Supported property needs to be updated to "readonly" as there may be a 
reason where the supported thermal modes are changed by the server of 
the interface due to machine configuration differences.

>
> ---
>
> For the sdbus++ interface YAML files we have some flags that can be
> added to attributes.  These flags correspond to flags available in the
> underlying sdbus vtable functions[1].  Through investigation of
> openbmc/sdbusplus#48[2] I came to realize that our documentation of
> 'const' did not match what SD_BUS_VTABLE_PROPERTY_CONST meant.
>
> The old documentation said:
>
>      The flag `const` makes the property read-only via D-Bus but still
>      writable by the app implementing it.
>
> The PROPERTY_CONST says:
>
>      PROPERTY_CONST corresponds to const and means that the property never
>      changes during the lifetime of the object it belongs to, so no signal
>      needs to be emitted.
>
> The words are quite different.  To deal with this I have done two
> things[3]:
>
>     a. Fix the documentation of 'const' to match PROPERTY_CONST's
>        intention.
>     b. Add a new flag 'readonly' to match the previously documented
>        behavior.
>
> The new documentation reads:
>
>      Both `const` and `readonly` prevent D-Bus clients from being able to
>      write to a property.  `const` is a D-Bus indication that the property
>      can never change, while `readonly` properties can be changed by the D-Bus
>      server itself.  As examples, the `Version` property on a software object
>      might be appropriate to be `const` and the `Value` property on a sensor
>      object would likely be `readonly`.
>
> You might ask why I didn't fix 'const' to match the documentation.  I
> chose to change the documentation instead for two reasons.  First, the
> code using these flags has been tested, so it is a less risky change to
> simply update the human-read documentation.  Second, we were always
> calling a near identical-named sdbus macro, so it is more intuitive to
> have matching behavior for matching names.
>
> What does this mean for us?  A few thoughts.

Are there any code update implications after these interfaces are 
changed from const to readonly that would require code changes by the 
server code implementing them?

>     * I expect some of the 'const' flags in phosphor-dbus-interfaces are
>       wrong and should be changed to 'readonly'.  I have collected a list
>       of them in a gist[4].  If you really intend to mean "this property
>       will never change during the life of an object" continue to use
>       'const', but if you mean "this property shall not be changed by
>       clients", use 'readonly' (and probably also add 'emits_change').
>
>     * Implementations should really be careful using 'const' because the
>       default behavior of sdbusplus/server/object.hpp is
>       'emit_object_added' in the constructor, but the 'const' properties
>       themselves are likely set later which is a violation of the
>       'PROPERTY_CONST' documentation.  A process could listen for the
>       ObjectAdded signal and use the results of that to cache your
>       'const' properties, which haven't been fully initialized yet, and a
>       later PropertyChanged signal will never come when the real property has
>       been initialized.
>
>     * We don't currently have code in sdbus++ generated servers to
>       prevent changing 'const' properties after the ObjectAdded or
>       InterfaceAdded signal has been sent.  This could be added at a
>       later time to try to catch these cases.
>
> Thank you for reading this far!  Like usual, reach out if I've messed
> something up or what I've written above is not clear.
>
> 1. https://manpages.debian.org/experimental/libsystemd-dev/SD_BUS_WRITABLE_PROPERTY.3.en.html#Flags
> 2. https://github.com/openbmc/sdbusplus/issues/48
> 3. https://github.com/openbmc/sdbusplus/commit/e1c73d3bf8f6cabc1c58f67a233dba55b6f76d74
> 4. https://gist.github.com/williamspatrick/fa975c33f00640ca54a7aa246bbbfeb9
>
