Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B2BF7EB
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 19:50:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fMs03S4TzDqdp
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 03:50:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fMr94PjnzDqqD
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 03:49:27 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 10:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; 
 d="scan'208,217";a="390806350"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.166.18])
 ([10.252.166.18])
 by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2019 10:49:22 -0700
Subject: Re: User management via WebUI vs ipmitool
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
References: <cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com>
 <12335442-8818-d0f5-da44-14a0addc0140@linux.vnet.ibm.com>
 <CAAMkS11b3PShKFRW+1RHLDsrbbP+G3Az5g-WjMGkT_97b0rOYg@mail.gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <4ced6939-d1b7-5369-77b8-25671141ec20@linux.intel.com>
Date: Thu, 26 Sep 2019 23:19:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAMkS11b3PShKFRW+1RHLDsrbbP+G3Az5g-WjMGkT_97b0rOYg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------EE960345AC8D7A0C9EC9205F"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------EE960345AC8D7A0C9EC9205F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

yes, this is known problem, and there are changes under review which 
will fix the same as well. If i remember correctly, there should be an 
issue already for this.

Issue: NoAccess is not in Redfish roles, and hence AccountService will 
not be able to get users with that privilege.

Following changes under review will fix the same.

1. https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/23962/

2.https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/24784/

regards,

Richard

On 9/26/2019 3:02 PM, Rahul Maheshwari wrote:
> Gunnar
> I tested and found that this problem is only seen when we don't assign 
> privilege to user after creating using IPMItool. See below steps for 
> more details.
>
> Step to hit the problem and fix it up.
> 1. Create IPMI user using below command
>  ipmitool -I lanplus -H <BMC_IP> -U root -P 0penBmc user set name 2 
> user_ipmi
>
> 2. Login to GUI and navigate to user account page(here you will see no 
> user exist message in GUI's user page)
>
> 3. Now assign any privilege to user using below command
>  ipmitool -I lanplus -H <BMC_IP> -U root -P 0penBmc channel setaccess 
> 1 2 privilege=2
>
> 4. Now refresh the GUI user page(here you will see that all users are 
> visible now).
>
> This problem is not with Redfish as we are able to see all users 
> after creating user using IPMI without any permission. So this seem 
> like a problem which need to be fixed from GUI side.
>
> $ curl -k -H "X-Auth-Token: $bmc_token" -X GET 
> https://${BMC_IP}/redfish/v1/AccountService/Accounts/
> {
>   "@odata.context": 
> "/redfish/v1/$metadata#ManagerAccountCollection.ManagerAccountCollection",
>   "@odata.id <http://odata.id>": "/redfish/v1/AccountService/Accounts",
>   "@odata.type": "#ManagerAccountCollection.ManagerAccountCollection",
>   "Description": "BMC User Accounts",
>   "Members": [
>     {
>       "@odata.id <http://odata.id>": 
> "/redfish/v1/AccountService/Accounts/user_ipmi"
>     },
>     {
>       "@odata.id <http://odata.id>": 
> "/redfish/v1/AccountService/Accounts/root"
>     }
>   ],
>   "Members@odata.count": 2,
>   "Name": "Accounts Collection"
>
> Thanks
> Rahul
>
> On Thu, Sep 26, 2019 at 3:13 AM Gunnar Mills 
> <gmills@linux.vnet.ibm.com <mailto:gmills@linux.vnet.ibm.com>> wrote:
>
>
>     On 9/25/2019 5:20 AM, rgrs wrote:
>>
>>     Is there any difference in user management from WebUI and ipmitool?
>>     When I add user via WebUI, a user is created and deleted
>>     immediately. Not sure why.
>
>     The WebUI uses the Redfish API to create/update/delete users.
>     https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616
>
>      Ratan or Richard do you know what is going on here?
>
>>     When I add user via IPMItool, users are getting added but WebUI
>>     user configuration page is blank.
>
>     I thought IPMI and Redfish users were treated the same in
>     phosphor-user-manager.
>
>     What version of OpenBMC?
>
>>
>>     *_Logs:_*
>>     *journalctl (User creation with WebUI):*
>>     Sep 25 09:17:52 mybmc nslcd[1127]: [200854] <passwd="TestUser">
>>     no available LDAP server found: Server is unavailable: Transport
>>     endpoint is not connected
>>     Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8] <passwd=1000> no
>>     available LDAP server found: Server is unavailable: Transport
>>     endpoint is not connected
>>     Sep 25 09:17:52 mybmc useradd[1816]: new user: name=TestUser,
>>     UID=1000, GID=100, home=/home/TestUser, shell=/bin/sh
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'web'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
>>     'redfish'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
>>     'priv-admin'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'ipmi'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
>>     group 'web'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
>>     group 'redfish'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
>>     group 'priv-admin'
>>     Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
>>     group 'ipmi'
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/passwd` was written to
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/passwd` was moved into place, adding watch
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/group` was written to
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/group` was moved into place, adding watch
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/passwd` (27)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/group` (28)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/passwd` (27)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/group` (28)
>>     Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:52 mybmc phosphor-user-manager[1119]: User created
>>     successfully
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete user 'TestUser'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group
>>     'web'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group
>>     'redfish'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group
>>     'priv-admin'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group
>>     'ipmi'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
>>     shadow group 'web'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
>>     shadow group 'redfish'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
>>     shadow group 'priv-admin'
>>     Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
>>     shadow group 'ipmi'
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/passwd` was written to
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/passwd` was moved into place, adding watch
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/group` was written to
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
>>     `/etc/group` was moved into place, adding watch
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/passwd` (29)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/group` (30)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/passwd` (29)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
>>     `/etc/group` (30)
>>     Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
>>     `/etc` (2)
>>     Sep 25 09:17:53 mybmc phosphor-user-manager[1119]: User deleted
>>     successfully
>>

--------------EE960345AC8D7A0C9EC9205F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>yes, this is known problem, and there are changes under review
      which will fix the same as well. If i remember correctly, there
      should be an issue already for this.<br>
    </p>
    <p>Issue: NoAccess is not in Redfish roles, and hence AccountService
      will not be able to get users with that privilege.</p>
    <p>Following changes under review will fix the same. <br>
    </p>
    <p>1. <a
        href="https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/23962/">https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/23962/</a></p>
    <p>2.<a
href="https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/24784/">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/24784/</a></p>
    <p>regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 9/26/2019 3:02 PM, Rahul Maheshwari
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAAMkS11b3PShKFRW+1RHLDsrbbP+G3Az5g-WjMGkT_97b0rOYg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Gunnar<br>
        I tested and found that this problem is only seen when we don't
        assign privilege to user after creating using IPMItool. See
        below steps for more details. <br>
         <br>
        Step to hit the problem and fix it up.<br>
        1. Create IPMI user using below command<br>
         ipmitool -I lanplus -H &lt;BMC_IP&gt; -U root -P 0penBmc user
        set name 2 user_ipmi<br>
        <br>
        2. Login to GUI and navigate to user account page(here you will
        see no user exist message in GUI's user page)<br>
        <br>
        3. Now assign any privilege to user using below command<br>
         ipmitool -I lanplus -H &lt;BMC_IP&gt; -U root -P 0penBmc
        channel setaccess 1 2 privilege=2<br>
         <br>
        4. Now refresh the GUI user page(here you will see that all
        users are visible now).
        <div><br>
        </div>
        <div>This problem is not with Redfish as we are able to see all
          users after creating user using IPMI without any permission.
          So this seem like a problem which need to be fixed from GUI
          side.<br>
          <div><br>
          </div>
          <div>$ curl -k -H "X-Auth-Token: $bmc_token" -X GET
            <a class="moz-txt-link-freetext" href="https://$">https://$</a>{BMC_IP}/redfish/v1/AccountService/Accounts/<br>
            {<br>
              "@odata.context":
"/redfish/v1/$metadata#ManagerAccountCollection.ManagerAccountCollection",<br>
              "@<a href="http://odata.id" moz-do-not-send="true">odata.id</a>":
            "/redfish/v1/AccountService/Accounts",<br>
              "@odata.type":
            "#ManagerAccountCollection.ManagerAccountCollection",<br>
              "Description": "BMC User Accounts",<br>
              "Members": [<br>
                {<br>
                  "@<a href="http://odata.id" moz-do-not-send="true">odata.id</a>":
            "/redfish/v1/AccountService/Accounts/user_ipmi"<br>
                },<br>
                {<br>
                  "@<a href="http://odata.id" moz-do-not-send="true">odata.id</a>":
            "/redfish/v1/AccountService/Accounts/root"<br>
                }<br>
              ],<br>
              <a class="moz-txt-link-rfc2396E" href="mailto:Members@odata.count">"Members@odata.count"</a>: 2,<br>
              "Name": "Accounts Collection"<br>
          </div>
          <div><br>
          </div>
          <div>Thanks</div>
          <div>Rahul</div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Sep 26, 2019 at 3:13
          AM Gunnar Mills &lt;<a href="mailto:gmills@linux.vnet.ibm.com"
            moz-do-not-send="true">gmills@linux.vnet.ibm.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div bgcolor="#FFFFFF">
            <p><br>
            </p>
            <div>On 9/25/2019 5:20 AM, rgrs wrote:<br>
            </div>
            <blockquote type="cite">
              <div><br>
              </div>
              <div>Is there any difference in user management from WebUI
                and ipmitool?<br>
              </div>
              <div>When I add user via WebUI, a user is created and
                deleted immediately. Not sure why.<br>
              </div>
            </blockquote>
            <p>The WebUI uses the Redfish API to create/update/delete
              users. <br>
              <a
href="https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616"
                target="_blank" moz-do-not-send="true">https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616</a><br>
            </p>
            <p> Ratan or Richard do you know what is going on here?</p>
            <blockquote type="cite">
              <div>When I add user via IPMItool, users are getting added
                but WebUI user configuration page is blank.<br>
              </div>
            </blockquote>
            <br>
            I thought IPMI and Redfish users were treated the same in
            phosphor-user-manager.<br>
            <br>
            What version of OpenBMC?<br>
            <br>
            <blockquote type="cite">
              <div><br>
              </div>
              <div><b><u>Logs:</u></b><br>
              </div>
              <div><b>journalctl (User creation with WebUI):</b><br>
              </div>
              <div>Sep 25 09:17:52 mybmc nslcd[1127]: [200854]
                &lt;passwd="TestUser"&gt; no available LDAP server
                found: Server is unavailable: Transport endpoint is not
                connected<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8]
                &lt;passwd=1000&gt; no available LDAP server found:
                Server is unavailable: Transport endpoint is not
                connected<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: new user:
                name=TestUser, UID=1000, GID=100, home=/home/TestUser,
                shell=/bin/sh<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to group 'web'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to group 'redfish'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to group 'priv-admin'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to group 'ipmi'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to shadow group 'web'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to shadow group 'redfish'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to shadow group 'priv-admin'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser'
                to shadow group 'ipmi'<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
                `/etc/passwd` was written to<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
                `/etc/passwd` was moved into place, adding watch<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
                `/etc/group` was written to<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file
                `/etc/group` was moved into place, adding watch<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                file `/etc/passwd` (27)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                file `/etc/group` (28)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                file `/etc/passwd` (27)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                file `/etc/group` (28)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:52 mybmc phosphor-user-manager[1119]:
                User created successfully<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete user
                'TestUser'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from group 'web'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from group 'redfish'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from group 'priv-admin'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from group 'ipmi'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from shadow group 'web'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from shadow group 'redfish'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from shadow group 'priv-admin'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc userdel[1822]: delete
                'TestUser' from shadow group 'ipmi'<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
                `/etc/passwd` was written to<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
                `/etc/passwd` was moved into place, adding watch<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
                `/etc/group` was written to<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file
                `/etc/group` was moved into place, adding watch<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                file `/etc/passwd` (29)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                file `/etc/group` (30)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                file `/etc/passwd` (29)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                file `/etc/group` (30)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring
                directory `/etc` (2)<br>
              </div>
              <div>Sep 25 09:17:53 mybmc phosphor-user-manager[1119]:
                User deleted successfully<br>
              </div>
              <div><br>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------EE960345AC8D7A0C9EC9205F--
