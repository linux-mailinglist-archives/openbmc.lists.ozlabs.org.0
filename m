Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41455BEE7E
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:33:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f8qT0QWKzDqnf
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 19:33:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=rahulmaheshwari01@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mKRoN1SX"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f8pn6fQ7zDqgl
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 19:32:32 +1000 (AEST)
Received: by mail-io1-xd29.google.com with SMTP id r26so4688649ioh.8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M1bJkZ0X2wPuSvOW7U2jtEfhgD9Zx2aoUvWEvnA14aQ=;
 b=mKRoN1SXadbiOG5L5ntI6d8T+/r3A7RsmvIvtIf71EIvPLIhiJntUXTrE4UU8w3yhb
 iu8OEdZ/qbZdqYiz8hYiQgHytTqZUNALWQkSX8EUTYyKkA7rvsRi7wUhulqW39btIC0n
 1NPZI12STWp83khSmOr5oO77a/Mh0Fg47ukRcRnwRJ59Fs9cX12ZwaCcs7mhe+dosrk/
 bY5rrHNG8HRt43I+riAAHaeaYx6brwL0lqFNAOWw0x5jl/dOis0Qr03RvQ3wpboxJm7I
 IyRLqzd3glvHnmo2FL8y0uGvNnnbpcFGurRjZJrVfYk9HRb6iLuahzi9qkvqC3ntVdgD
 jQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M1bJkZ0X2wPuSvOW7U2jtEfhgD9Zx2aoUvWEvnA14aQ=;
 b=GWbazSbWvPPgprHcCY/x89eEWc6xSf+ADdU7Mn18d9cMoD2n0w1KaZj+avqxc9cBWi
 ExO618qEGGwJzfCtmWGSCcd8wUVrqy4mo1uVLe7A4S71FgQfUfam7JcVxEfPWE5hN3Pl
 4ftEYURAQeAUrn40PAkFWj050zsYpQfwIbkPGCJGf2ehtzoyPhuQ9GXhHrX96arIFazn
 578nBhBLCqoZHHoHqicBzEFWYVb8IommC5ofSKvgsjKfMpQE+GwIv30hZbmZ/Kb0Xstz
 40Hxfx7L++4IKyjdUrf4GWtWvyKYX8rPWmPqq6v8rx0kMJJmD4UDxAAkSmaUdJzfGU3b
 xekA==
X-Gm-Message-State: APjAAAWX6K/k6Jrd10/2nfUrxzh6ZUbJNDnv8I6qQXJnEX1+nHAd1bpz
 kggKqkYucMLbTwSROeDI4NjltOo586uuYc8EyMs=
X-Google-Smtp-Source: APXvYqyiuOGCpOJsd3/xBOUSuV567A5rZTJMEaRn7kXFA/vCttQ7iSWSxRSosrjeVN/d3ljHwdFPn/q5NuGedPnwttc=
X-Received: by 2002:a92:3854:: with SMTP id f81mr1404834ila.31.1569490348553; 
 Thu, 26 Sep 2019 02:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com>
 <12335442-8818-d0f5-da44-14a0addc0140@linux.vnet.ibm.com>
In-Reply-To: <12335442-8818-d0f5-da44-14a0addc0140@linux.vnet.ibm.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Thu, 26 Sep 2019 15:02:47 +0530
Message-ID: <CAAMkS11b3PShKFRW+1RHLDsrbbP+G3Az5g-WjMGkT_97b0rOYg@mail.gmail.com>
Subject: Re: User management via WebUI vs ipmitool
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000b43aba059371725b"
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
 rgrs <rgrs@protonmail.com>, richard.marian.thomaiyar@linux.intel.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b43aba059371725b
Content-Type: text/plain; charset="UTF-8"

Gunnar
I tested and found that this problem is only seen when we don't assign
privilege to user after creating using IPMItool. See below steps for more
details.

Step to hit the problem and fix it up.
1. Create IPMI user using below command
 ipmitool -I lanplus -H <BMC_IP> -U root -P 0penBmc user set name 2
user_ipmi

2. Login to GUI and navigate to user account page(here you will see no user
exist message in GUI's user page)

3. Now assign any privilege to user using below command
 ipmitool -I lanplus -H <BMC_IP> -U root -P 0penBmc channel setaccess 1 2
privilege=2

4. Now refresh the GUI user page(here you will see that all users are
visible now).

This problem is not with Redfish as we are able to see all users
after creating user using IPMI without any permission. So this seem like a
problem which need to be fixed from GUI side.

$ curl -k -H "X-Auth-Token: $bmc_token" -X GET https://
${BMC_IP}/redfish/v1/AccountService/Accounts/
{
  "@odata.context":
"/redfish/v1/$metadata#ManagerAccountCollection.ManagerAccountCollection",
  "@odata.id": "/redfish/v1/AccountService/Accounts",
  "@odata.type": "#ManagerAccountCollection.ManagerAccountCollection",
  "Description": "BMC User Accounts",
  "Members": [
    {
      "@odata.id": "/redfish/v1/AccountService/Accounts/user_ipmi"
    },
    {
      "@odata.id": "/redfish/v1/AccountService/Accounts/root"
    }
  ],
  "Members@odata.count": 2,
  "Name": "Accounts Collection"

Thanks
Rahul

On Thu, Sep 26, 2019 at 3:13 AM Gunnar Mills <gmills@linux.vnet.ibm.com>
wrote:

>
> On 9/25/2019 5:20 AM, rgrs wrote:
>
>
> Is there any difference in user management from WebUI and ipmitool?
> When I add user via WebUI, a user is created and deleted immediately. Not
> sure why.
>
> The WebUI uses the Redfish API to create/update/delete users.
>
> https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616
>
>  Ratan or Richard do you know what is going on here?
>
> When I add user via IPMItool, users are getting added but WebUI user
> configuration page is blank.
>
>
> I thought IPMI and Redfish users were treated the same in
> phosphor-user-manager.
>
> What version of OpenBMC?
>
>
> *Logs:*
> *journalctl (User creation with WebUI):*
> Sep 25 09:17:52 mybmc nslcd[1127]: [200854] <passwd="TestUser"> no
> available LDAP server found: Server is unavailable: Transport endpoint is
> not connected
> Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8] <passwd=1000> no available
> LDAP server found: Server is unavailable: Transport endpoint is not
> connected
> Sep 25 09:17:52 mybmc useradd[1816]: new user: name=TestUser, UID=1000,
> GID=100, home=/home/TestUser, shell=/bin/sh
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'web'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'redfish'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'priv-admin'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group 'ipmi'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow group 'web'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow group
> 'redfish'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow group
> 'priv-admin'
> Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow group 'ipmi'
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` was
> written to
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` was
> moved into place, adding watch
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/group` was
> written to
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/group` was
> moved into place, adding watch
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file `/etc/passwd` (27)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file `/etc/group` (28)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file `/etc/passwd` (27)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file `/etc/group` (28)
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:52 mybmc phosphor-user-manager[1119]: User created
> successfully
> Sep 25 09:17:53 mybmc userdel[1822]: delete user 'TestUser'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 'web'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 'redfish'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group
> 'priv-admin'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 'ipmi'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow group
> 'web'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow group
> 'redfish'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow group
> 'priv-admin'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow group
> 'ipmi'
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` was
> written to
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` was
> moved into place, adding watch
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/group` was
> written to
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/group` was
> moved into place, adding watch
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file `/etc/passwd` (29)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file `/etc/group` (30)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file `/etc/passwd` (29)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file `/etc/group` (30)
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory `/etc` (2)
> Sep 25 09:17:53 mybmc phosphor-user-manager[1119]: User deleted
> successfully
>
>

--000000000000b43aba059371725b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Gunnar<br>I tested and found that this problem is only see=
n when we don&#39;t assign privilege to user after creating using IPMItool.=
 See below steps for more details.=C2=A0<br>=C2=A0<br>Step to hit the probl=
em and fix it up.<br>1. Create IPMI user using below command<br>=C2=A0ipmit=
ool -I lanplus -H &lt;BMC_IP&gt; -U root -P 0penBmc user set name 2 user_ip=
mi<br><br>2. Login to GUI and navigate to user account page(here you will s=
ee no user exist message in GUI&#39;s user page)<br><br>3. Now assign any p=
rivilege to user using below command<br>=C2=A0ipmitool -I lanplus -H &lt;BM=
C_IP&gt; -U root -P 0penBmc channel setaccess 1 2 privilege=3D2<br>=C2=A0<b=
r>4. Now refresh the GUI user page(here you will see that all users are vis=
ible now).<div><br></div><div>This problem is not with Redfish as we are ab=
le to see all users after=C2=A0creating user using IPMI without any permiss=
ion. So this seem like a problem which need to be fixed from GUI side.<br><=
div><br></div><div>$ curl -k -H &quot;X-Auth-Token: $bmc_token&quot; -X GET=
 https://${BMC_IP}/redfish/v1/AccountService/Accounts/<br>{<br>=C2=A0 &quot=
;@odata.context&quot;: &quot;/redfish/v1/$metadata#ManagerAccountCollection=
.ManagerAccountCollection&quot;,<br>=C2=A0 &quot;@<a href=3D"http://odata.i=
d">odata.id</a>&quot;: &quot;/redfish/v1/AccountService/Accounts&quot;,<br>=
=C2=A0 &quot;@odata.type&quot;: &quot;#ManagerAccountCollection.ManagerAcco=
untCollection&quot;,<br>=C2=A0 &quot;Description&quot;: &quot;BMC User Acco=
unts&quot;,<br>=C2=A0 &quot;Members&quot;: [<br>=C2=A0 =C2=A0 {<br>=C2=A0 =
=C2=A0 =C2=A0 &quot;@<a href=3D"http://odata.id">odata.id</a>&quot;: &quot;=
/redfish/v1/AccountService/Accounts/user_ipmi&quot;<br>=C2=A0 =C2=A0 },<br>=
=C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 &quot;@<a href=3D"http://odata.id">=
odata.id</a>&quot;: &quot;/redfish/v1/AccountService/Accounts/root&quot;<br=
>=C2=A0 =C2=A0 }<br>=C2=A0 ],<br>=C2=A0 &quot;Members@odata.count&quot;: 2,=
<br>=C2=A0 &quot;Name&quot;: &quot;Accounts Collection&quot;<br></div><div>=
<br></div><div>Thanks</div><div>Rahul</div></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 26, 2019 at 3:=
13 AM Gunnar Mills &lt;<a href=3D"mailto:gmills@linux.vnet.ibm.com">gmills@=
linux.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div>On 9/25/2019 5:20 AM, rgrs wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div><br>
      </div>
      <div>Is there any difference in user management from WebUI and
        ipmitool?<br>
      </div>
      <div>When I add user via WebUI, a user is created and deleted
        immediately. Not sure why.<br>
      </div>
    </blockquote>
    <p>The WebUI uses the Redfish API to create/update/delete users. <br>
<a href=3D"https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe=
3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616" target=3D"_b=
lank">https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c=
7acd9f9792fab96a68/app/common/services/api-utils.js#L616</a><br>
    </p>
    <p>=C2=A0Ratan or Richard do you know what is going on here?</p>
    <blockquote type=3D"cite">
      <div>When I add user via IPMItool, users are getting added but
        WebUI user configuration page is blank.<br>
      </div>
    </blockquote>
    <br>
    I thought IPMI and Redfish users were treated the same in
    phosphor-user-manager.<br>
    <br>
    What version of OpenBMC?<br>
    <br>
    <blockquote type=3D"cite">
      <div><br>
      </div>
      <div><b><u>Logs:</u></b><br>
      </div>
      <div><b>journalctl (User creation with WebUI):</b><br>
      </div>
      <div>Sep 25 09:17:52 mybmc nslcd[1127]: [200854]
        &lt;passwd=3D&quot;TestUser&quot;&gt; no available LDAP server foun=
d: Server
        is unavailable: Transport endpoint is not connected<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8]
        &lt;passwd=3D1000&gt; no available LDAP server found: Server is
        unavailable: Transport endpoint is not connected<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: new user: name=3DTestUser,
        UID=3D1000, GID=3D100, home=3D/home/TestUser, shell=3D/bin/sh<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to g=
roup
        &#39;web&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to g=
roup
        &#39;redfish&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to g=
roup
        &#39;priv-admin&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to g=
roup
        &#39;ipmi&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to s=
hadow
        group &#39;web&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to s=
hadow
        group &#39;redfish&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to s=
hadow
        group &#39;priv-admin&#39;<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add &#39;TestUser&#39; to s=
hadow
        group &#39;ipmi&#39;<br>
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
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
        `/etc/passwd` (27)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
        `/etc/group` (28)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
        `/etc/passwd` (27)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring file
        `/etc/group` (28)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:52 mybmc phosphor-user-manager[1119]: User
        created successfully<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete user &#39;TestUser&#=
39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        group &#39;web&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        group &#39;redfish&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        group &#39;priv-admin&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        group &#39;ipmi&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        shadow group &#39;web&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        shadow group &#39;redfish&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        shadow group &#39;priv-admin&#39;<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete &#39;TestUser&#39; f=
rom
        shadow group &#39;ipmi&#39;<br>
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
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
        `/etc/passwd` (29)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
        `/etc/group` (30)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
        `/etc/passwd` (29)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring file
        `/etc/group` (30)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitoring directory
        `/etc` (2)<br>
      </div>
      <div>Sep 25 09:17:53 mybmc phosphor-user-manager[1119]: User
        deleted successfully<br>
      </div>
      <div><br>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000b43aba059371725b--
