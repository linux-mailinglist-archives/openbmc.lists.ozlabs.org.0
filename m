Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A550161CA3
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 22:10:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LxTM5LGdzDqkS
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 08:10:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LxSW27q3zDqXr
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 08:09:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HL8rAR145251
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 16:09:28 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6e1gubme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 16:09:28 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HL5BBP028460
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:27 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2y6896cr29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:27 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HL9QMi16122840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:26 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87E7828059
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:26 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AA3328058
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:26 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:09:26 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Implement the Redfish PasswordChangeRequired property
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <962ebfab-0c34-b016-3409-5e64e28d6b13@linux.ibm.com>
Date: Mon, 17 Feb 2020 15:09:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_13:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=827
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170173
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

This proposes implementing the Redfish [PasswordChangeRequired 
property][] and an underlying D-Bus PasswordExpired property.

These would be incremental changes to [OpenBMC user management][] and 
affect:
  - [phosphor-user-manager][]
  - [openbmc_project User D-Bus interfaces][]
  - [BMCWeb Redfish ManagerAccount REST APIs][]

[PasswordChangeRequired property]: 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.9.0.pdf
[OpenBMC user management]: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md
[phosphor-user-manager]: https://github.com/openbmc/phosphor-user-manager
[openbmc_project User D-Bus interfaces]: 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/User
[BMCWeb Redfish ManagerAccount REST APIs]: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp

When this is merged, the PasswordChangeRequired property could be used 
as follows:
- The BMC admin can determine (via REST APIs) which local accounts have 
expired passwords.
- We can implement the [expired-password design][], which requires this 
property per the [expired-password code review][].
- We can add this field to the webui user-management page.

[expired-password design]: 
https://github.com/openbmc/docs/blob/master/designs/expired-password.md
[expired-password code review]: 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29136


Detailed design changes:

1. Add a new PasswordExpired property to the existing [D-Bus 
xyz.openbmc_project.User.Attributes interface][] to indicate if the 
password is expired.

[D-Bus xyz.openbmc_project.User.Attributes interface]: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/User/Attributes.interface.yaml

2. Update [phosphor-user-manager][] to implement this property for local 
users.
Reading can use something like the "chage --list" command.
I vote to make this property read-only, but if needed, writing a true 
value can invoke the "passwd --expire" command.

3. Implement the Redfish PasswordChangeRequired property in BMCWeb.
This would be read-only.
This affects existing Redfish ManagerAccount objects at URI 
/redfish/v1/AccountService/Accounts/SOMEUSER.
This property would be present for local accounts and omitted for LDAP 
accounts.

4. Update the [OpenBMC user management][] doc as needed.

- Joseph

