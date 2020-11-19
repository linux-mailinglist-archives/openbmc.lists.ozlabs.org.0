Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D52B9163
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 12:52:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcJ2m2jtBzDqly
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 22:52:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcHzg5q03zDqlY
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 22:50:06 +1100 (AEDT)
IronPort-SDR: 8SkwUUnK5T3x0kEFpI4d3g8TihgzeDIw7c3K6BwKfFBaPPv/UAfL4XgznG6aCcNK5Px8C57phA
 jGwF3tEFktog==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171373446"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
 d="scan'208,217";a="171373446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 03:50:01 -0800
IronPort-SDR: cB+59BG6Hib6TM9+nRro8C8A6LEaqxCTKRJCmpz1hZfoWrKIf/VonLPNkaAw4+jV6JEddhZ2aX
 S/98SHihugaw==
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
 d="scan'208,217";a="476794840"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.251.76.54])
 ([10.251.76.54])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 03:50:00 -0800
Subject: Re: User-manager default group roles
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 Ed Tanous <ed@tanous.net>
References: <8031d32c-9dd2-a72a-7751-8784fe9d2d99@linux.ibm.com>
 <f22719fc-1851-eac9-50ee-fe95dace291a@linux.intel.com>
 <77e2e674-23a9-1d2f-7cdd-88a3f5535e1c@linux.ibm.com>
 <2a47d048-7b27-7aa6-f813-18e985976c0a@linux.intel.com>
 <c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <ec923bf7-d23d-bc45-9c31-2aded4b1fa68@linux.intel.com>
Date: Thu, 19 Nov 2020 17:19:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------5A402BDA2359511AA87B52EA"
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
--------------5A402BDA2359511AA87B52EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/18/2020 10:23 PM, Joseph Reynolds wrote:
> On 11/18/20 1:11 AM, Thomaiyar, Richard Marian wrote:
>>
>> On 11/18/2020 12:47 AM, Joseph Reynolds wrote:
>>> On 11/17/20 11:21 AM, Thomaiyar, Richard Marian wrote:
>>>> Hi Joseph, For SSH to work fine, user must be part of priv-admin...
>>>> This Message Is From an External Sender
>>>> This message came from outside your organization.
>>>>
>>>> Hi Joseph,
>>>>
>>>> For SSH to work fine, user must be part of priv-admin and must have 
>>>> command/shell as /bin/sh under /etc/passwd file instead of 
>>>> /bin/nologin. Note: There is no direct group called ssh under 
>>>> /etc/group, instead it is just emulated one from 
>>>> phosphor-user-manager to add corresponding shell binary to the user.
>>>> usermod --shell /bin/sh -G priv-admin ${USER}
>>>>
>>>> If requirement is SSH to be allowed based on group and allowed for 
>>>> all user privileges, then user shell can be updated using usermod 
>>>> --shell /bin/sh itself, but need to remove EXTRA_ARGS from the 
>>>> dropbear.default 
>>>> <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default>
>>>
>>> Richard,
>>>
>>> Thanks for the info.  I do intend to separate the "ssh" group role 
>>> from the "priv-admin" privilege role.  My use case for the admin to 
>>> NOT have ssh privilege, but the service user account does have ssh 
>>> privilege.  I think this is cleaner and applicable to multiple use 
>>> cases.
>> In this case, need to remove the -G priv-admin from dropbear.defaults 
>> (but all users who have sh command/shell, will be able to login) and 
>> ssh doesn't provide any authorization for commands based on privileges.
>>>
>>> For the OpenBMC project defaults, I propose that when a new user is 
>>> dynamically created with the "priv-admin" role, they also get the 
>>> "ssh" group role.  After the user account is created, I do not 
>>> intend for "priv-admin" and "ssh"  be be tied together, meaning you 
>>> can change one and not the other, and you will get the results you 
>>> expect.
>>>
>> Yes, i see your use case and user must be able to ssh irrespective of 
>> privilege role he is in.
>>> I understand the full set of work for this includes:
>>> 1. Create the "ssh" Linux group to represent the "ssh" group role.
>>
>> Not needed (unless we really require to support usermod command - 
>> "usermod -G "ssh" ${USER}). Won't usermod --shell /bin/sh ${USER} 
>> won't be enough for covering the same. Assuming this is not the way 
>> we are going to ask end-user to create a user.
>
> Thanks for explaining!  Yes, using /bin/nologin works just as 
> well...and does not need a new Linux group.
>
>>
>>> 2. Change the dropbear.defaults to "-G ssh" (was "-G priv-admin"). 
>>> There may be forward compatibility concerns: for example, when this 
>>> changes, everyone in the priv-admin group should be added to the 
>>> "ssh" group.
>>> 3. Change phosphor-user-manager [6] to re-swizzle the login shell 
>>> path when a user is added or removed from the "ssh" group.
>>> 4. Implement BMCWeb REST APIs [7], if desired.
>>
>> We don't require any change in bmweb rest API's for this, as these 
>> are build time configurable (i.e. for ssh priv-admin). 
>> phosphor-user-manager already provided D-Bus property to support 
>> different account groups, i.e. for AccountTypes (Redfish,Ipmi 
>> etc.)(for the schema update you are working with redfish forum). Once 
>> the schema is defined, we just need to update the bmcweb to update 
>> the property accordingly.
>>
>> Let me know if you have any other reason / usecase, which will not 
>> work with this approach. If needed, we can even discuss this in 
>> security WG.
>
> My only other customized use case is to disable SSH access for all 
> roles, including the builtin root/admin user.  To be clear, the SSH 
> service will be present on my BMC, but only my special pre-created 
> "service" account will be allowed to access a BMC command shell via 
> SSH, and the BMC customer/admin has no way to cange who is authorized 
> to use SSH.  <-- I think I get this for free because there are not 
> REST APIs for the admin to control who has SSH access.  (Does SSH 
> authentication use LDAP?)
>
> - Joseph
>
Roles & groups are not directly related, In OpenBMC it is kept 
separately, please refer below for the corrections. Regarding LDAP SSH 
authentication, our current stack won't be able to, as we need to add 
support to create home dir (pam_mkhomedir) for LDAP (which is not 
available today). Apart from making the dropbear.default change (to 
remove priv-admin), please do the following

_*To remove SSH group:*_

If SSH needs to be disabled for all newly created users (during 
runtime), then please remove "ssh" from 
https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp#L200 
(With removal of ssh from here, both IPMI & Redfish will automatically 
detect the same, and further new user creation will happen without SSH 
group support).

Note: We can make this groups & privileges configurable using bb 
configuration to have easy override.

_*To add ssh to dummyuser  (build time):*_

In local.conf.sample please add the following under EXTRA_USERS_PARAMS 
(Note: dummyuser can be created using USERADD_PARAM).

   usermod --shell /bin/sh dummyuser; \

  with the above changes, only root will be able to use ssh and users 
created using IPMI / Redfish won't be able to login to SSH.

Let me know, if this works, we can make this as configurable

>>
>> Regards,
>>
>> Richard
>>
>>>
>>> - Joseph
>>>
>>> P.S. I intend to repeat this exercise for the ipmi group role.
>>>
>>> [6]: 
>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml
>>> [7]: 
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp
>>>
>>>> Regards,
>>>>
>>>> Richard
>>>>
>>>> On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
>>>>>
>>>>> What is the right way to assign default phosphor-user-manager 
>>>>> "group roles" to dynamically created users?
>>>>>
>>>>> Background: Currently, when a new local user is created via 
>>>>> Redfish API POST /redfish/v1/AccountService/Accounts you have to 
>>>>> specify a Redfish RoleId.  BMCWeb maps the RoleId to a phosphor 
>>>>> user manager "Privilege Role" [1] and assigns ALL of the "group 
>>>>> roles" to the new user [2].  Per [3] this is not intended, and I 
>>>>> need to fix this for my use case.
>>>>>
>>>> usermod --shell /bin/sh -G priv-admin ${USER} is the correct 
>>>> command for per[3].
>
> Got it.  Thanks for explaining.  I understand: membership in the 
> phosphor group-role "ssh" correlates exactly with the user account's 
> login shell being "/bin/sh" (as opposed to "/bin/nologin").  In this 
> way, any user who successfully authenticates to SSH then faces two 
> additional blocks:
>  - User must be a member of the "priv-admin" group.  I intend to 
> remove this check.
>  - User's login shell is used.  If /bin/sh then the user gains 
> access.  If /bin/nologin then the SSH session exits.
>
> I think that works for me.
>
>>>>> IMHO, the correct approach is for the project to define a mapping 
>>>>> from "role" to "privilege role" that can be used when dynamically 
>>>>> creating a new user.  For example, the admin role maps to "ssh 
>>>>> ipmi redfish web" whereas the readonly role maps to "ipmi redfish 
>>>>> web" (omits "ssh"). Then images can customize this as needed.
>>>>>
>>>>> But where should this mapping be applied?  Does it belong in 
>>>>> BMCWeb or in phosphor-user-manager [4]?  Should we have another 
>>>>> D-Bus property [5] to give this mapping?
>>>> As of today, we are not separating user groups. All users created 
>>>> in OpenBMC belongs to the build time configured groups.
>
> Should SSH access only be given to "admin" users?  More generally, 
> what is the intended design to provide the default group roles? Should 
> all dynamically created local user accounts be given "ssh" access?  Or 
> should ssh access only be given to "admin" users?

> To control the defaults and provide a general mechanism, I propose a 
> new D-Bus property for [5]:
>     - name: DefaultGroups
>       type: dict[string, array[string]]
>       flags:
>           - const
>       description: >
>           Maps from each privilege in AllPrivileges to the default 
> groups for
>           that privilege role (a subset of AllGroups) in a form 
> suitable for
>           CreateUser.GroupNames.
>
> with implementation [4] in:
>     /** @brief Maps from privilege to default set of groups */
>     std::map<std::string,std::vector<std::string>> privToGroupsMgr =
>     {
>         {"priv-admin", {"web", "redfish", "ipmi", "ssh"}},
>         {"priv-operator", {"web", "redfish", "ipmi"}},
>         {"priv-user", {"web", "redfish", "ipmi"}},
>         {"priv-noaccess", {}}
>     };
>
Not really, privileges & groups are designed to exist separately. i.e. 
All users created in OpenBMC belong to {"web", "redfish", "ipmi", "ssh"} 
groups, irrespective of their privilege levels

privileges / roles --> Used to provide authorization level for the 
OpenBMC application.

groups --> Used to indicate whether user is allowed to be authenticated 
with the specified application.

Both IPMI & Redfish today allows to configure the privileges/roles for a 
user, but doesn't allow to configure the groups (hence we had a build 
time configured group roles - fixed). With the new AccountTypes property 
discussed, groups can be configured through Redfish and for IPMI we can 
rely on OpenBMC OEM IPMI commands.

i.e. User can belong to group {"web", "redfish", "ipmi", "ssh"} and with 
"priv-user". In this case, web/redfish /ipmi application must allow only 
user privilege related commands to be executed (As authorization based 
control is not available for SSH, for security reason, we limited ssh 
support for priv-admin user only). i.e. Through Redfish / ipmi, if the 
user privilege is increased to "priv-admin" (Administrative) privilege, 
then user can login to ssh too, and if it is changed to "priv-noaccess", 
then it means user is disabled for authorization, and not allowed to do 
any access.

Regards,

Richard

> Then when BMCWeb creates a new local account [7], it can use the new 
> DefaultGroups property (indexed by the role) instead of AllGroups.
>
> - Joseph
>
>>>>>
>>>>> - Joseph
>>>>>
>>>>> [1]: 
>>>>> https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>>>>> [2]: 
>>>>> https://github.com/openbmc/bmcweb/blob/929d4b57f10bc4200e16b71fbcf32521d8cc23c1/redfish-core/lib/account_service.hpp#L1435
>>>>> [3]: https://github.com/openbmc/openbmc/issues/3643
>>>>> [4]: 
>>>>> https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp
>>>>> [5]: 
>>>>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Manager.interface.yaml
>>>>>
>>>
>

--------------5A402BDA2359511AA87B52EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/18/2020 10:23 PM, Joseph Reynolds
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com">On
      11/18/20 1:11 AM, Thomaiyar, Richard Marian wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 11/18/2020 12:47 AM, Joseph Reynolds wrote:
        <br>
        <blockquote type="cite">On 11/17/20 11:21 AM, Thomaiyar, Richard
          Marian wrote:
          <br>
          <blockquote type="cite">Hi Joseph, For SSH to work fine, user
            must be part of priv-admin...
            <br>
            This Message Is From an External Sender
            <br>
            This message came from outside your organization.
            <br>
            <br>
            Hi Joseph,
            <br>
            <br>
            For SSH to work fine, user must be part of priv-admin and
            must have command/shell as /bin/sh under /etc/passwd file
            instead of /bin/nologin. Note: There is no direct group
            called ssh under /etc/group, instead it is just emulated one
            from phosphor-user-manager to add corresponding shell binary
            to the user.
            <br>
            usermod --shell /bin/sh -G priv-admin ${USER}
            <br>
            <br>
            If requirement is SSH to be allowed based on group and
            allowed for all user privileges, then user shell can be
            updated using usermod --shell /bin/sh itself, but need to
            remove EXTRA_ARGS from the dropbear.default
<a class="moz-txt-link-rfc2396E" href="https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default">&lt;https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/dropbear.default&gt;</a><br>
          </blockquote>
          <br>
          Richard,
          <br>
          <br>
          Thanks for the info.  I do intend to separate the "ssh" group
          role from the "priv-admin" privilege role.  My use case for
          the admin to NOT have ssh privilege, but the service user
          account does have ssh privilege.  I think this is cleaner and
          applicable to multiple use cases.
          <br>
        </blockquote>
        In this case, need to remove the -G priv-admin from
        dropbear.defaults (but all users who have sh command/shell, will
        be able to login) and ssh doesn't provide any authorization for
        commands based on privileges.
        <br>
        <blockquote type="cite">
          <br>
          For the OpenBMC project defaults, I propose that when a new
          user is dynamically created with the "priv-admin" role, they
          also get the "ssh" group role.  After the user account is
          created, I do not intend for "priv-admin" and "ssh"  be be
          tied together, meaning you can change one and not the other,
          and you will get the results you expect.
          <br>
          <br>
        </blockquote>
        Yes, i see your use case and user must be able to ssh
        irrespective of privilege role he is in.
        <br>
        <blockquote type="cite">I understand the full set of work for
          this includes:
          <br>
          1. Create the "ssh" Linux group to represent the "ssh" group
          role.
          <br>
        </blockquote>
        <br>
        Not needed (unless we really require to support usermod command
        - "usermod -G "ssh" ${USER}). Won't usermod --shell /bin/sh
        ${USER} won't be enough for covering the same. Assuming this is
        not the way we are going to ask end-user to create a user.
        <br>
      </blockquote>
      <br>
      Thanks for explaining!  Yes, using /bin/nologin works just as
      well...and does not need a new Linux group.
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">2. Change the dropbear.defaults to "-G
          ssh" (was "-G priv-admin"). There may be forward compatibility
          concerns: for example, when this changes, everyone in the
          priv-admin group should be added to the "ssh" group.
          <br>
          3. Change phosphor-user-manager [6] to re-swizzle the login
          shell path when a user is added or removed from the "ssh"
          group.
          <br>
          4. Implement BMCWeb REST APIs [7], if desired.
          <br>
        </blockquote>
        <br>
        We don't require any change in bmweb rest API's for this, as
        these are build time configurable (i.e. for ssh priv-admin).
        phosphor-user-manager already provided D-Bus property to support
        different account groups, i.e. for AccountTypes (Redfish,Ipmi
        etc.)(for the schema update you are working with redfish forum).
        Once the schema is defined, we just need to update the bmcweb to
        update the property accordingly.
        <br>
        <br>
        Let me know if you have any other reason / usecase, which will
        not work with this approach. If needed, we can even discuss this
        in security WG.
        <br>
      </blockquote>
      <br>
      My only other customized use case is to disable SSH access for all
      roles, including the builtin root/admin user.  To be clear, the
      SSH service will be present on my BMC, but only my special
      pre-created "service" account will be allowed to access a BMC
      command shell via SSH, and the BMC customer/admin has no way to
      cange who is authorized to use SSH.  &lt;-- I think I get this for
      free because there are not REST APIs for the admin to control who
      has SSH access.  (Does SSH authentication use LDAP?)
      <br>
      <br>
      - Joseph
      <br>
      <br>
    </blockquote>
    <p>Roles &amp; groups are not directly related, In OpenBMC it is
      kept separately, please refer below for the corrections. Regarding
      LDAP SSH authentication, our current stack won't be able to, as we
      need to add support to create home dir (pam_mkhomedir) for LDAP
      (which is not available today). Apart from making the
      dropbear.default change (to remove priv-admin), please do the
      following<br>
    </p>
    <p><u><b>To remove SSH group:</b></u><br>
    </p>
    <p>If SSH needs to be disabled for all newly created users (during
      runtime), then please remove "ssh" from
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp#L200">https://github.com/openbmc/phosphor-user-manager/blob/master/user_mgr.hpp#L200</a>
      (With removal of ssh from here, both IPMI &amp; Redfish will
      automatically detect the same, and further new user creation will
      happen without SSH group support).</p>
    <p>Note: We can make this groups &amp; privileges configurable using
      bb configuration to have easy override.<br>
    </p>
    <p><u><b>To add ssh to dummyuser  (build time):</b></u></p>
    <p>In local.conf.sample please add the following under
      EXTRA_USERS_PARAMS (Note: dummyuser can be created using
      USERADD_PARAM).<br>
    </p>
    <p>  usermod --shell /bin/sh dummyuser; \</p>
    <p> with the above changes, only root will be able to use ssh and
      users created using IPMI / Redfish won't be able to login to SSH.</p>
    <p>Let me know, if this works, we can make this as configurable<br>
    </p>
    <blockquote type="cite"
      cite="mid:c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com">
      <blockquote type="cite">
        <br>
        Regards,
        <br>
        <br>
        Richard
        <br>
        <br>
        <blockquote type="cite">
          <br>
          - Joseph
          <br>
          <br>
          P.S. I intend to repeat this exercise for the ipmi group role.
          <br>
          <br>
          [6]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml</a><br>
          [7]:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp">https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp</a><br>
          <br>
          <blockquote type="cite">Regards,
            <br>
            <br>
            Richard
            <br>
            <br>
            On 11/17/2020 3:49 AM, Joseph Reynolds wrote:
            <br>
            <blockquote type="cite">
              <br>
              What is the right way to assign default
              phosphor-user-manager "group roles" to dynamically created
              users?
              <br>
              <br>
              Background: Currently, when a new local user is created
              via Redfish API POST /redfish/v1/AccountService/Accounts
              you have to specify a Redfish RoleId.  BMCWeb maps the
              RoleId to a phosphor user manager "Privilege Role" [1] and
              assigns ALL of the "group roles" to the new user [2].  Per
              [3] this is not intended, and I need to fix this for my
              use case.
              <br>
              <br>
            </blockquote>
            usermod --shell /bin/sh -G priv-admin ${USER} is the correct
            command for per[3].
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
      Got it.  Thanks for explaining.  I understand: membership in the
      phosphor group-role "ssh" correlates exactly with the user
      account's login shell being "/bin/sh" (as opposed to
      "/bin/nologin").  In this way, any user who successfully
      authenticates to SSH then faces two additional blocks:
      <br>
       - User must be a member of the "priv-admin" group.  I intend to
      remove this check.
      <br>
       - User's login shell is used.  If /bin/sh then the user gains
      access.  If /bin/nologin then the SSH session exits.
      <br>
      <br>
      I think that works for me.
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">IMHO, the correct approach is for
              the project to define a mapping from "role" to "privilege
              role" that can be used when dynamically creating a new
              user.  For example, the admin role maps to "ssh ipmi
              redfish web" whereas the readonly role maps to "ipmi
              redfish web" (omits "ssh"). Then images can customize this
              as needed.
              <br>
              <br>
              But where should this mapping be applied?  Does it belong
              in BMCWeb or in phosphor-user-manager [4]?  Should we have
              another D-Bus property [5] to give this mapping?
              <br>
            </blockquote>
            As of today, we are not separating user groups. All users
            created in OpenBMC belongs to the build time configured
            groups.
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
      Should SSH access only be given to "admin" users?  More generally,
      what is the intended design to provide the default group roles?
      Should all dynamically created local user accounts be given "ssh"
      access?  Or should ssh access only be given to "admin" users?<br>
    </blockquote>
    <br>
    <blockquote type="cite"
      cite="mid:c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com">To
      control the defaults and provide a general mechanism, I propose a
      new D-Bus property for [5]:
      <br>
          - name: DefaultGroups
      <br>
            type: dict[string, array[string]]
      <br>
            flags:
      <br>
                - const
      <br>
            description: &gt;
      <br>
                Maps from each privilege in AllPrivileges to the default
      groups for
      <br>
                that privilege role (a subset of AllGroups) in a form
      suitable for
      <br>
                CreateUser.GroupNames.
      <br>
      <br>
      with implementation [4] in:
      <br>
          /** @brief Maps from privilege to default set of groups */
      <br>
          std::map&lt;std::string,std::vector&lt;std::string&gt;&gt;
      privToGroupsMgr =
      <br>
          {
      <br>
              {"priv-admin", {"web", "redfish", "ipmi", "ssh"}},
      <br>
              {"priv-operator", {"web", "redfish", "ipmi"}},
      <br>
              {"priv-user", {"web", "redfish", "ipmi"}},
      <br>
              {"priv-noaccess", {}}
      <br>
          };
      <br>
      <br>
    </blockquote>
    <p>Not really, privileges &amp; groups are designed to exist
      separately. i.e. All users created in OpenBMC belong to {"web",
      "redfish", "ipmi", "ssh"} groups, irrespective of their privilege
      levels<br>
    </p>
    <p>privileges / roles --&gt; Used to provide authorization level for
      the OpenBMC application. <br>
    </p>
    <p>groups --&gt; Used to indicate whether user is allowed to be
      authenticated with the specified application. <br>
    </p>
    <p>Both IPMI &amp; Redfish today allows to configure the
      privileges/roles for a user, but doesn't allow to configure the
      groups (hence we had a build time configured group roles - fixed).
      With the new AccountTypes property discussed, groups can be
      configured through Redfish and for IPMI we can rely on OpenBMC OEM
      IPMI commands.</p>
    <p>i.e. User can belong to group {"web", "redfish", "ipmi", "ssh"}
      and with "priv-user". In this case, web/redfish /ipmi application
      must allow only user privilege related commands to be executed (As
      authorization based control is not available for SSH, for security
      reason, we limited ssh support for priv-admin user only). i.e.
      Through Redfish / ipmi, if the user privilege is increased to
      "priv-admin" (Administrative) privilege, then user can login to
      ssh too, and if it is changed to "priv-noaccess", then it means
      user is disabled for authorization, and not allowed to do any
      access.</p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <blockquote type="cite"
      cite="mid:c0ad5f1b-43de-2db9-8b71-29dd14a067ec@linux.ibm.com">Then
      when BMCWeb creates a new local account [7], it can use the new
      DefaultGroups property (indexed by the role) instead of AllGroups.
      <br>
      <br>
      - Joseph
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
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
          </blockquote>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------5A402BDA2359511AA87B52EA--
