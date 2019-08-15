Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C836A8F72E
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 00:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468hQX3y51zDqh2
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 08:46:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468hPv4KZxzDqS6
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 08:46:10 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FMfVeB052391; Thu, 15 Aug 2019 18:46:06 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udemdbr1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 18:46:06 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7FMjstf002625;
 Thu, 15 Aug 2019 22:46:04 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2u9nj65kwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2019 22:46:04 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7FMk40r53412176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 22:46:04 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84D4EB2064;
 Thu, 15 Aug 2019 22:46:04 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E9CB205F;
 Thu, 15 Aug 2019 22:46:04 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Aug 2019 22:46:04 +0000 (GMT)
Subject: Re: BMCWeb changes for expired password design
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
 <21bdc6a1-2397-c115-cdb6-201ebf3041b2@intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c1fba479-a81c-bd63-0157-42143ffab08a@linux.ibm.com>
Date: Thu, 15 Aug 2019 17:46:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21bdc6a1-2397-c115-cdb6-201ebf3041b2@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150215
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



On 8/13/19 3:38 PM, Ed Tanous wrote:
> On 8/13/19 1:09 PM, Joseph Reynolds wrote:
>> Ed,
>>
>> Please review the "expired password" design:
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
>>
> Richard would likely be a better person to poke, as he wrote the user
> management design doc originally.
+1

>
> My main concerns are around the requirements.  I would like to see
> mentioned that we:
> 1. Intend to implement something in compliance with California bill
> SB-327 Information privacy: connected devices, and document the relevant
> requirements from that bill.
> 2. We intend to implement the Redfish initial password mechanism as the
> spec has defined, to ensure interop with other Redfish devices.
>
> I think the details on the second one seem to be lacking at bit.  I see
> a lot of design elements and flows, but I would've expected most of it
> to simply be "we intend to implement the Redfish flow for default
> passwords" then only provide details where it's missing or optional in
> the spec.
>
> If we're building something that's redfish, but unique to OpenBMC , or
> counter to the spec, I'm going to have a tough time supporting it, as it
> will cause confusion, and somewhat defeat the purpose of having an
> industry standard.
>
>> Implementing this requires a few BMCWeb changes:
>> - For the `/login` URI: when a correct but expired password is given,
>> indicate the password was expired via HTTP response body:
>> "Unauthorized.  Password expired.  Use Redfish APIs to change the
>> password.", and do not create a session.
>> - For Basic Auth (https://user:password@host): when a correct but
>> expired password is given, give HTTP response code 403 or similar.
> With what content in the response?  This will need to differ for
> Redfish, the rest dbus apis, and HTML responses, as they all expect
> different error handling.  Simply mentioning that you intend to support
> the correct error codes for all 3 would be fine.
>
>> - For Redfish sessions: when a correct password is given, create the
>> session as usual, but set the PasswordChangeRequired field (based on
>> PAM_NEW_AUTHTOK_REQD).
>> - Limit access from sessions which have PasswordChangeRequired=True as
>> follows:
>>      + The session can only be used to GET its own account and session
>> information, PATCH its own account's password, and log out.
>>      + Successfully changing the password terminates the session. That
>> is, the session does not change from PasswordChangeRequired=True to
>> PasswordChangeRequired=False.
> I'm interested to see how this will be executed in practice, as we only
> have a fixed-at-compile-time privilege to url map.  This would need to
> be adjusted, and we would either need to define a new OEM privilege type
> (that we may or may not hide) or come up with a way to dynamically
> adjust privileges on the fly.
>
>>      + Other uses get HTTP response code 403 (or similar).
>> - The existing password changing mechanism would be used, with the
>> additional behavior that when ((PasswordChangeRequired=True) and (the
>> password was successfully changed)), the session will terminate.
>>
>> These changes are based on the design and the Redfish
>> PasswordChangeRequired handling specifications (referenced by the
>> design).  Would you take a BMCWeb patch to implement this?
> I typed the above having looked at an old version of your document.  You
> seem to have adjusted it a bit to cover the redfish stuff, which is
> excellen.
>
> Yes, I would have no problem with a patchset to do this.  Some important
> design points to consider.
>
> 1. Please do not recreate the existing privileges module to do the
> above.  Your design should be able to fit into what's there.
> 2. Please do not have a fixed "go/no-go" url list separate from the
> other 2 we already have.  Please keep your changes inside the existing
> url routing infrastructure by tagging your "ok without auth" routes
> appropriately.

Here are some low level design ideas:

Enhance bmcweb/include/pam_authenticate.hpp - pamAuthenticateUser() like:
   inline bool pamAuthenticateUser(const std::string_view username,
     const std::string_view password,
     bool &passwordChangeRequired)
so that if the password is correct but expired, the function will return 
true and set passwordChangeRequired=true.

This change will get the passwordChangeRequired status to where it is 
needed.  As you mentioned, each of those will respond differently:
- Basic Auth will fail when passwordChangeRequired=true
- POST /login will fail when passwordChangeRequired=true, with an 
additional message
- POST /redfish/v1/SessionManager/Sessions will succeed when 
passwordChangeRequired=true

Naturally, the crow::persistent_data::UserSession will store the new 
passwordChangeRequired field, with all the changes that requires.

Skipping ahead a bit, I think 
crow::token_authorization::Middleware.beforeHandle() should have the 
following logic after it successfully locates a session:
   if (req.session.passwordChangeRequired &&
       !isOnPasswordChangeRequiredWhitelist(req))
   then fail with HTTP status 403 and an explanation in the payload

Where new function isOnPasswordChangeRequiredWhitelist returns true in 
the following cases:
   isOnWhitelist(req) || GET or DELETE mySession || GET or PATCH myAccount

Doing it this way seems the most clear and only adds a few cycles in the 
usual case.  It seems like having a new whitelist for this situation is 
correct because Redfish specifies that these interfaces are needed for 
PasswordChangeRequired handling.  And this way avoids having to change 
the authority model.

What do you think?

- Joseph

>
> I suspect overall, this is going to be difficult, but worthwhile, and
> I'd be happy to help review your changes when they're ready.
>

