Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1B1BE7D1
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:43:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ds4167YFzDqdP
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 07:42:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ds3P3jLGzDqdP
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 07:42:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8PLWwAN025811; Wed, 25 Sep 2019 17:42:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8dx9w5ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2019 17:42:18 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8PLY51h029243;
 Wed, 25 Sep 2019 17:42:18 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8dx9w5qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2019 17:42:18 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8PLeImA013176;
 Wed, 25 Sep 2019 21:42:17 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 2v5bg79jen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2019 21:42:17 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8PLgGTo8389172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 21:42:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A875124052;
 Wed, 25 Sep 2019 21:42:16 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50DA8124054;
 Wed, 25 Sep 2019 21:42:14 +0000 (GMT)
Received: from [9.102.45.89] (unknown [9.102.45.89])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Sep 2019 21:42:13 +0000 (GMT)
Subject: Re: User management via WebUI vs ipmitool
To: rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ratagupt@linux.vnet.ibm.com, richard.marian.thomaiyar@linux.intel.com
References: <cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <12335442-8818-d0f5-da44-14a0addc0140@linux.vnet.ibm.com>
Date: Wed, 25 Sep 2019 16:42:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com>
Content-Type: multipart/alternative;
 boundary="------------B02F16C9782AF2653166CC37"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909250174
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
--------------B02F16C9782AF2653166CC37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/25/2019 5:20 AM, rgrs wrote:
>
> Is there any difference in user management from WebUI and ipmitool?
> When I add user via WebUI, a user is created and deleted immediately. 
> Not sure why.

The WebUI uses the Redfish API to create/update/delete users.
https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616

  Ratan or Richard do you know what is going on here?

> When I add user via IPMItool, users are getting added but WebUI user 
> configuration page is blank.

I thought IPMI and Redfish users were treated the same in 
phosphor-user-manager.

What version of OpenBMC?

>
> *_Logs:_*
> *journalctl (User creation with WebUI):*
> Sep 25 09:17:52 mybmc nslcd[1127]: [200854] <passwd="TestUser"> no 
> available LDAP server found: Server is unavailable: Transport endpoint 
> is not connected
> Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8] <passwd=1000> no available 
> LDAP server found: Server is unavailable: Transport endpoint is not 
> connected
> Sep 25 09:17:52 mybmc useradd[1816]: new user: name=TestUser, 
> UID=1000, GID=100, home=/home/TestUser, shell=/bin/sh
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
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` 
> was written to
> Sep 25 09:17:52 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` 
> was moved into place, adding watch
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
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 
> 'redfish'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 
> 'priv-admin'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from group 'ipmi'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow 
> group 'web'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow 
> group 'redfish'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow 
> group 'priv-admin'
> Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from shadow 
> group 'ipmi'
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` 
> was written to
> Sep 25 09:17:53 mybmc nscd[1092]: 1092 monitored file `/etc/passwd` 
> was moved into place, adding watch
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

--------------B02F16C9782AF2653166CC37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/2019 5:20 AM, rgrs wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616">https://github.com/openbmc/phosphor-webui/blob/418db63c77aad03fe3401c7acd9f9792fab96a68/app/common/services/api-utils.js#L616</a><br>
    </p>
    <p> Ratan or Richard do you know what is going on here?</p>
    <blockquote type="cite"
cite="mid:cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com">
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
    <blockquote type="cite"
cite="mid:cxuypplMD4p5tYjtGnd1FnZAXWYwCuvRn7U6qlQ_E8fkPDnIiesmEvIbWSz4GAMH7Zm70_WwNHHS77ykmQKJsRVT6tXvOeFL4vexQ250E0I=@protonmail.com">
      <div><br>
      </div>
      <div><b><u>Logs:</u></b><br>
      </div>
      <div><b>journalctl (User creation with WebUI):</b><br>
      </div>
      <div>Sep 25 09:17:52 mybmc nslcd[1127]: [200854]
        &lt;passwd="TestUser"&gt; no available LDAP server found: Server
        is unavailable: Transport endpoint is not connected<br>
      </div>
      <div>Sep 25 09:17:52 mybmc nslcd[1127]: [b127f8]
        &lt;passwd=1000&gt; no available LDAP server found: Server is
        unavailable: Transport endpoint is not connected<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: new user: name=TestUser,
        UID=1000, GID=100, home=/home/TestUser, shell=/bin/sh<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
        'web'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
        'redfish'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
        'priv-admin'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to group
        'ipmi'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
        group 'web'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
        group 'redfish'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
        group 'priv-admin'<br>
      </div>
      <div>Sep 25 09:17:52 mybmc useradd[1816]: add 'TestUser' to shadow
        group 'ipmi'<br>
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
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete user 'TestUser'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        group 'web'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        group 'redfish'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        group 'priv-admin'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        group 'ipmi'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        shadow group 'web'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        shadow group 'redfish'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        shadow group 'priv-admin'<br>
      </div>
      <div>Sep 25 09:17:53 mybmc userdel[1822]: delete 'TestUser' from
        shadow group 'ipmi'<br>
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
  </body>
</html>

--------------B02F16C9782AF2653166CC37--

