Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F282BA784E
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 04:07:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NRyq4vCczDqng
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 12:06:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NRyB0T9PzDqdh
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 12:06:25 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8421td2079435; Tue, 3 Sep 2019 22:06:19 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ut1w83f3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 22:06:19 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8424Peg010129;
 Wed, 4 Sep 2019 02:06:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2uqgh73t4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 02:06:18 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8426HiA47120868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 02:06:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F1A613604F;
 Wed,  4 Sep 2019 02:06:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD34136055;
 Wed,  4 Sep 2019 02:06:16 +0000 (GMT)
Received: from demeter.local (unknown [9.80.213.191])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Sep 2019 02:06:16 +0000 (GMT)
Subject: Re: BMCWeb changes login password
To: "Wang, Kuiying" <kuiying.wang@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c73c4823-7fd1-0762-72d1-da1920897667@linux.ibm.com>
Date: Tue, 3 Sep 2019 21:06:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040020
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
Cc: "Jia, Chunhui" <chunhui.jia@intel.com>, "Li, Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/30/19 2:18 AM, Wang, Kuiying wrote:
>
> Currently only administrator is allowed to add user/modify user/change 
> password.
>
> Administrator has the permission to change other users password or 
> delete it directly.
>
> Administrator no need to know the old password of other users.
>
> For administrator to change itself password thing, still no need the 
> old password, because administrator is already login a session.
>
> So we don’t need to add “input field to enter the old password”.
>

I don't think we are talking about the same things here.

1. I agree that the BMC admin user should not have to enter the old 
password when changing a user's password.  => However, we may want to 
force the admin to re-enter their password when accessing a sensitive 
feature such as changing someone's account.  Reference the link below -

/https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#require-re-authentication-for-sensitive-features/


2. The scenario where we may want to ask for the old password is the 
"password change dialog".  This dialog is accessed when the user signs 
into the Web App login page and the web app informs the user that their 
password is expired and must be changed before they can access the BMC  
The dialog asks for their new password (twice) ... and does it also ask 
for the old password? <== That's the question.


> But there is an open for multiple administrator user supporting, 
> currently administrator user could add more administrator level users.
>
> And anyone of the administrators login, he could modify other 
> administrator users like change password or delete it directly.
>
> I think it is *a bit security issue*. Have to restrict multiple 
> administrator user or do not allow administrator to modify other 
> administrator users.
>
According to Redfish spec 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.7.0.pdf
section 13.2.9 ("Privilege model/Authorization"), the predefined 
"Administrator" role has the "ConfigureUsers" privilege.  It is my 
understanding that the ConfigureUsers privilege is sufficient 
(reference: section 13.2.6) to create, delete, and manage other user 
accounts.

Given this privilege model, I think you want to be able to trust your 
Admin users, and give less-trusted users the Operator role (section 
13.2.9).  If you were thinking of something more complicated, Redfish 
allows you to define Custom roles and OEM privileges.

- Joseph

> Thanks,
>
> Kwin.
>
> >//
> >/On 8/28/19 3:20 AM, George Liu (//刘锡伟) wrote:/
> >/>/
> >/> I want to discuss with everyone about the solution to change the login/
> >/> password./
> >/>/
> >/>   In the WEB, When the user needs to change the login password, the/
> >/> current solution is to directly enter the new password twice to change/
> >/> successfully, but the old password is not verified. the advantage is/
> >/> that we can use the new password through this solution if we forget/
> >/> the old password. but for the security reasons, I think should/
> >/> verifying the old password instead of directly entering the new/
> >/> password before change login password./
> >/>/
> >/> if everyone have any ideas or experience, please share, thanks!/
> >/>/
> >/Are you referring to the phosphor-webui design mentioned here?:/
> >/https://github.com/ibm-openbmc/dev/issues/1048/
> >//
> >/OWASP has some recommendations:/
> >//
> >/https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#require-re-authentication-for-sensitive-features/
> >//
> >/https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Sheet.html#step-4-allow-user-to-change-password-in-the-existing-session/
> Thanks, the password change was mentioned in step 4.
> I think should add an input field to enter the old password and verify it
> when the form is submitted(phosphor-webui).
> >//
> >//
> >/- Joseph/
> >//
> >
>

