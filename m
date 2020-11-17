Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED82B6B9C
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 18:22:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbCSX0L71zDqHx
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 04:22:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbCRg2RlQzDqVJ
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 04:22:06 +1100 (AEDT)
IronPort-SDR: Bt3y6v0FPI/9nMqG0Iu35/RvTHDgNyaES0kFK7ZFqhAfrD1yAiQcp4aUoWtPWlu3Y0JgVBcFdv
 Qm3tbJ5IrgSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="255681237"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
 d="scan'208,217";a="255681237"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 09:22:01 -0800
IronPort-SDR: AOu84FmLIsvYWu04ABhfRn5BGKEfAc7ietK7fdohRMBtB5o4BgMQ01gJRtr87hEQX4w3iKHYDv
 kH/gicdq9zIg==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
 d="scan'208,217";a="475996374"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.215.123.209])
 ([10.215.123.209])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 09:21:59 -0800
Subject: Re: User-manager default group roles
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 Ed Tanous <ed@tanous.net>
References: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
Date: Tue, 17 Nov 2020 22:51:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------EC2255D6A3575DB264D932F1"
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

This is a multi-part message in MIME format.
--------------EC2255D6A3575DB264D932F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Joseph,

For SSH to work fine, user must be part of priv-admin and must have 
command/shell as /bin/sh under /etc/passwd file instead of /bin/nologin. 
Note: There is no direct group called ssh under /etc/group, instead it 
is just emulated one from phosphor-user-manager to add corresponding 
shell binary to the user.
usermod --shell /bin/sh -G priv-admin ${USER}

If requirement is SSH to be allowed based on group and allowed for all 
user privileges, then user shell can be updated using usermod --shell 
/bin/sh itself, but need to remove EXTRA_ARGS from the dropbear.default 
<https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default>

Regards,

Richard

On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
>
> What is the right way to assign default phosphor-user-manager "group 
> roles" to dynamically created users?
>
> Background: Currently, when a new local user is created via Redfish 
> API POST /redfish/v1/AccountService/Accounts you have to specify a 
> Redfish RoleId.  BMCWeb maps the RoleId to a phosphor user manager 
> "Privilege Role" [1] and assigns ALL of the "group roles" to the new 
> user [2].  Per [3] this is not intended, and I need to fix this for my 
> use case.
>
usermod --shell /bin/sh -G priv-admin ${USER} is the correct command for 
per[3].
> IMHO, the correct approach is for the project to define a mapping from 
> "role" to "privilege role" that can be used when dynamically creating 
> a new user.  For example, the admin role maps to "ssh ipmi redfish 
> web" whereas the readonly role maps to "ipmi redfish web" (omits 
> "ssh").  Then images can customize this as needed.
>
> But where should this mapping be applied?  Does it belong in BMCWeb or 
> in phosphor-user-manager [4]?  Should we have another D-Bus property 
> [5] to give this mapping?
As of today, we are not separating user groups. All users created in 
OpenBMC belongs to the build time configured groups.
>
> - Joseph
>
> [1]: 
> https://github.com/openbmc/docs/blob/master/architecture/user-management.md
> [2]: 
> https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
> [3]: https://github.com/openbmc/openbmc/issues/3643
> [4]: 
> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
> [5]: 
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml
>

--------------EC2255D6A3575DB264D932F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Joseph, <br>
    </p>
    For SSH to work fine, user must be part of priv-admin and must have
    command/shell as /bin/sh under /etc/passwd file instead of
    /bin/nologin. Note: There is no direct group called ssh under
    /etc/group, instead it is just emulated one from
    phosphor-user-manager to add corresponding shell binary to the user.<br>
    usermod --shell /bin/sh -G priv-admin ${USER}<br>
    <br>
    If requirement is SSH to be allowed based on group and allowed for
    all user privileges, then user shell can be updated using usermod
    --shell /bin/sh itself, but need to remove EXTRA_ARGS from the <a
      moz-do-not-send="true"
href="https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default">dropbear.default</a><br>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 11/17/2020 3:49 AM, Joseph Reynolds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com">
      <br>
      What is the right way to assign default phosphor-user-manager
      "group roles" to dynamically created users?
      <br>
      <br>
      Background: Currently, when a new local user is created via
      Redfish API POST /redfish/v1/AccountService/Accounts you have to
      specify a Redfish RoleId.  BMCWeb maps the RoleId to a phosphor
      user manager "Privilege Role" [1] and assigns ALL of the "group
      roles" to the new user [2].  Per [3] this is not intended, and I
      need to fix this for my use case.
      <br>
      <br>
    </blockquote>
    usermod --shell /bin/sh -G priv-admin ${USER} is the correct command
    for per[3].<br>
    <blockquote type="cite"
      cite="mid:8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com">IMHO,
      the correct approach is for the project to define a mapping from
      "role" to "privilege role" that can be used when dynamically
      creating a new user.  For example, the admin role maps to "ssh
      ipmi redfish web" whereas the readonly role maps to "ipmi redfish
      web" (omits "ssh").  Then images can customize this as needed.
      <br>
      <br>
      But where should this mapping be applied?  Does it belong in
      BMCWeb or in phosphor-user-manager [4]?  Should we have another
      D-Bus property [5] to give this mapping?
      <br>
    </blockquote>
    As of today, we are not separating user groups. All users created in
    OpenBMC belongs to the build time configured groups.<br>
    <blockquote type="cite"
      cite="mid:8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com">
      <br>
      - Joseph
      <br>
      <br>
      [1]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/docs/blob/master/architecture/user-management.md">https://github.com/openbmc/docs/blob/master/architecture/user-management.md</a><br>
      [2]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435">https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435</a><br>
      [3]: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/3643">https://github.com/openbmc/openbmc/issues/3643</a>
      <br>
      [4]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp">https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp</a><br>
      [5]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml</a><br>
      <br>
    </blockquote>
  </body>
</html>

--------------EC2255D6A3575DB264D932F1--
