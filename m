Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDF9C0BDB
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 21:00:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g1Mq69rYzDr0r
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 05:00:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=rajeswaran.thillaigovindan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qIJ+Q85g"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g1Lw2mMDzDqY2
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 04:59:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q12so2078939pff.9
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=R6Q53XRw4Tm3tE9i7BiT8sFRrqEwq8Fw3jCHmfgqnzI=;
 b=qIJ+Q85gzwJLkzhHa0YSOFXpCxf/Qv5f+YuGU5y/OkfBqOBdY2pKkXIybQbau6T8SB
 xC/j+q87hymaRytDYdo/bjQybibL4XqeIpsCeW0kveilOpBFpF7sfwYUxg9d29EwRhGN
 4oYmVVVlI3VH+ofFkUshfURxRFqrx0lZlDzuNnNknCsZlkhBEn9WkY/2KfdHn5dlvCts
 pIe1EtfjceKGlBgMH4yq7VYvDBv7JORBQdtC6EOdRj4MrZj9Q3Xkbt7LdUjQ+YmP7Vs0
 1X/qs2m3DovvpWaQ/YuBKat/Dlt/eoG9nuHmMH+iOVRLPvLlEtfLLcMw4M/zjY0bMq+/
 BTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=R6Q53XRw4Tm3tE9i7BiT8sFRrqEwq8Fw3jCHmfgqnzI=;
 b=RUo548APAdJdPNfa/ajzNrgD/w87nnHFxx/bGdKI9imE2NPmHiekekwssO3SBpl+DF
 X5QnbaUg3sgRDIC4jCiJ0UfA8Aag2u28G4jdiy9+ImBJkX3D7mhEZkhZR4zHXeQYuOlx
 57UADaEzi/7O9cwcqRe0bFJOzE+AOEfBmffkeJ10LxI+nqFdsW83eQLugftbEtDkg4Lo
 qsmiLWStPb8Lk9iNQ4EBOBDtzZDwrDeHGogFQisCnrzMUf7va/JIli7lmbNemY5A98aJ
 24ZL79Kvp336RX0doehGTnJhfiYuyEKfkr+K9AYSBVplWDYOWyct1Moshp2AzrTk6HB0
 h7qw==
X-Gm-Message-State: APjAAAVm/Rt2Z7kggVUgHEJOfxPqCJO7hiad+8ajZGM/lh8TG49PsX2r
 TCMrvyhZunNHvV3adUopZK5nbDkZ
X-Google-Smtp-Source: APXvYqw7rNwhDM7R5hxzD+g8CmKD8NDtHyrdANMBukv4q3aZRpB9WfcIqM2H186HAZ8rtlFAE/Us5w==
X-Received: by 2002:a17:90a:336d:: with SMTP id
 m100mr11511079pjb.35.1569610784028; 
 Fri, 27 Sep 2019 11:59:44 -0700 (PDT)
Received: from ?IPv6:2405:204:578d:ddfd:64c0:d471:f9fa:3b3e?
 ([2405:204:578d:ddfd:64c0:d471:f9fa:3b3e])
 by smtp.gmail.com with ESMTPSA id x6sm5939878pfd.53.2019.09.27.11.59.41
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 11:59:43 -0700 (PDT)
To: openbmc@lists.ozlabs.org
From: RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>
Subject: Authorization of LDAP users in bmcweb:
Message-ID: <5ea56cca-3575-a1dc-06a8-aefe6be3031e@gmail.com>
Date: Sat, 28 Sep 2019 00:29:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

We would like to discuss the following points raised in the gerrit 
commit 23538 (https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/23538).

1. Why is LDAP any different than non-ldap in phosphor-user-manager?  Do 
LDAP users not get registered with the system?  That seems odd.

LDAP users are not managed by OpenBMC. Unlike local users, privileges 
are assigned directly to the LDAP user.
For LDAP user, it is a two step process:
- Get the Group Name
- Look for the privilege for the group

For local users
- Each user is directly part of group(priv-admin/priv-user/priv-callback).

Why D-Bus objects are not created for LDAP users?

    There is no use-case for it. Few reasons are listed below:
    -> LDAP is used for authentication and not for user management
    -> If we show LDAP users, OpenBMC admin cannot do anything for those 
users
    -> LDAP notifications are not there. So, we cannot update the LDAP 
user object.
https://www.openldap.org/lists/openldap-technical/201008/msg00175.html
https://lists.arthurdejong.org/nss-pam-ldapd-users/2019/msg00035.html
       We can look for sync option by using some other opensource tool; 
but do we require that much complexity?

2. All of the matches you've listed seem to already be present in 
bmcweb.  I'm confused what exactly you're adding.

We have added matches only for local users, who have D-Bus objects.

For LDAP users, D-Bus objects are not created. Hence, they will not be 
found in the live user-role map.

For LDAP users, we need to make the call for getpw, getgr, getgr_name 
using (ldap_nss module)
which internally makes a call to the LDAP and get the group name.

OpenBMC manages LDAP role group and privileges and a D-Bus object is 
created for each such role group. Like live user-role map for local 
users, we need a live role group - privilege map for LDAP users.

3. The above makes me think that we're logging in users that don't 
necessarily have a username on the system, which seems really contrary 
to the design, where PAM is used to interchange user privileges.  What 
you suggest above seems to be breaking that?

I am sorry that I could not understand what you mean by "PAM is used to 
interchange user privileges". PAM is used only for authentication.

For getting the privileges, we shall call getpw_nam and getgr_id. For 
local users, these APIs are not used as D-Bus object has this info.

For LDAP users, we call getpw, getgr, getgr_name using (ldap_nss module) 
which internally calls LDAP and get the results.

The user management application provides the method GetUserInfo() to get 
the local and LDAP user privileges. This method abstracts how the 
privileges are stored and retrieved. This is as per the user-management 
design.

We have discussed this in the community call around a year back.

