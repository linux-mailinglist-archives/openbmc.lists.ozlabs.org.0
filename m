Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F334932AB
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 03:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdpnp0jtsz30NS
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 13:03:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WMcpBNYR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WMcpBNYR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdpnH2BxTz2xBf
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 13:02:42 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20J0vb5q027078; 
 Wed, 19 Jan 2022 02:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8UBSgFtdLH+qCVD9dXaztyKYSm4ML7+H8sABCWwud0A=;
 b=WMcpBNYRX+siQWoYc1yO2M3Do4GKPdZFqH7LagHMcz+yX9tyQwH8FYwjLDaPLSpTdSEx
 kdu9wF3f8t1I35wmCzJdpJ/41xtBnz9ni8TPwO90ebTgrxQJ+WwoVWVDz7NlHPN7Yahl
 puR38v95nsNJnkbdGxDedLABHV2dWmwSQxIUKH5gB4XmbCGeSOx6AcPb4M4nt1ZyfvfL
 LDcOC9i1G5YaTI1KewMlVXDfKP3GRvs7bqPNcCVR3wgbfo/rocI+4UfC39wsGhZ3s4IS
 Tkek9zvC/VVCyP4BzTOX+1UhDWdaovzlLetH5kXFtlTGaIuiPjs1JiBhA7n2uco8Ms3d Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp8je0wfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 02:02:35 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20J20MKT032080;
 Wed, 19 Jan 2022 02:02:35 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp8je0wf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 02:02:35 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20J1b5AP025598;
 Wed, 19 Jan 2022 02:02:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3dknwa65v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 02:02:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20J22XhQ32178512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 02:02:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6244BC6055;
 Wed, 19 Jan 2022 02:02:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4D53C605F;
 Wed, 19 Jan 2022 02:02:32 +0000 (GMT)
Received: from [9.160.36.49] (unknown [9.160.36.49])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Jan 2022 02:02:32 +0000 (GMT)
Message-ID: <46eb0109-568f-163f-5212-7d7102bc6369@linux.ibm.com>
Date: Tue, 18 Jan 2022 20:02:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: =?UTF-8?B?UmU6IOetlOWkjTogVXBkYXRlIChvciBnZW5lcmF0ZSkgL2V0Yy9pcG1p?=
 =?UTF-8?Q?=5fpass_file?=
Content-Language: en-US
To: "Zhao, Jiaqing" <jiaqing.zhao@intel.com>,
 "Mantey, JohnathanX" <johnathanx.mantey@intel.com>,
 =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>,
 "mine260309@gmail.com" <mine260309@gmail.com>
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
 <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
 <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
 <3eb8983b-5023-660f-9993-3699880aa61d@intel.com>
 <CO1PR11MB4785FBED8A7E760D14A878CC8E4C9@CO1PR11MB4785.namprd11.prod.outlook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <CO1PR11MB4785FBED8A7E760D14A878CC8E4C9@CO1PR11MB4785.namprd11.prod.outlook.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: amudX-FPR0K9BU0BOQdvOxpdTXZun39A
X-Proofpoint-ORIG-GUID: Au2S5dv_8MycZANnVhvsChfwCkQrNfzr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_06,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190006
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/6/22 11:09 AM, Zhao, Jiaqing wrote:
> Even you set minlen=0 in /etc/pam.d/common-password, the password 
> length will still be checked by pam-cracklib. Pam-cracklib will call 
> FascistCheck() function of cracklib, and inside cracklib, it will call 
> FascistLookUser(), which also checkes ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
>
> Even you set minlen=0 in /etc/pam.d/common-password, the password 
> length will still be checked by pam-cracklib. Pam-cracklib will call 
> FascistCheck() function of cracklib, and inside cracklib, it will call 
> FascistLookUser(), which also checkes the password length and there is 
> no way to bypass it unless you modify cracklib code. The minimum 
> length forced by cracklib is 6.
>
> https://github.com/cracklib/cracklib/blob/c66d74fc38e1632726da8230714bf62f6128e212/src/lib/fascist.c#L721
>
> FascistLookUser() also contain other implicit conditions your password 
> must met. Please also be careful about them.
>
> Of course, you can comment out the pam_cracklib.so to bypass all these 
> checks.
>

If your /etc/pam.d/common-password file look like this 
(meta-phosphor/recipes-extended/pam/libpam/pam.d/common-password): 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-password
then you should be able to comment out the pam_cracklib.so and 
pam_ipmicheck.so and pam_pwhistory.so lines
but then you have to remove the "use_authtok" parameter from the 
pam_unix.so line (or whichever is your first module).

Be sure to:
- keep the pam_unix.so line (it writes the password into /etc/shadow file).
- keep the pam_ipmisave.so line (it writes the password to the 
etc/ipmi_pass file)
- keep the deny and permit lines as they are.

Good luck,
- Joseph

> *From:* openbmc 
> <openbmc-bounces+jiaqing.zhao=intel.com@lists.ozlabs.org> *On Behalf 
> Of *Johnathan Mantey
> *Sent:* Friday, January 7, 2022 00:55
> *To:* Xiaochao Ma (马小超) <maxiaochao@inspur.com>; mine260309@gmail.com
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: 答复: Update (or generate) /etc/ipmi_pass file
>
> The OBMC PAM requires the password to be 8 characters in length, and 
> probably requires a numeral as well.
> I realize you want to get to a 5 character password.
> I recommend you try adding a user with a password that works with the 
> existing rules to see if your automated creation method works. After 
> that you can try creating shorter passwords.
>
> On 1/5/22 23:02, Xiaochao Ma (马小超) wrote:
>
>     Sorry I didn't explain some of the methods I tried  : (
>
>     1. I tried the method you mentioned, but failed.
>
>     The length of the password I want to set is 5 digits.
>
>     I modified the complexity setting via /etc/pam.d/common-password, but still cannot set a 5-digit password. (The setting for reducing the length requirement failed to take effect)
>
>     2. I also tried to temporarily remove pam_cracklib.so in /etc/pam.d/common-pasword so that it does not perform complexity detection. Failed very directly......
>
>     -----邮件原件-----
>
>     发件人: Lei YU [mailto:mine260309@gmail.com  <mailto:mine260309@gmail.com>]
>
>     发送时间: 2022年1月6日  14:41
>
>     收件人: Xiaochao Ma (马小超)<maxiaochao@inspur.com>  <mailto:maxiaochao@inspur.com>
>
>     抄送:openbmc@lists.ozlabs.org
>
>     主题: Re: Update (or generate) /etc/ipmi_pass file
>
>     On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma (马小超)<maxiaochao@inspur.com>  <mailto:maxiaochao@inspur.com>  wrote:
>
>         Hello everyone
>
>         I now want to add a default user to my own machine (I modified
>
>         obmc-phosphor-image.bbappend, use the useradd… ),
>
>         but the new default user cannot use Ipmi. It is because the ipmi_pass file is not updated.
>
>            I couldn't find a method/tool to generate ipmi_pass file. So how can I generate a new ipmi_pass file?
>
>     What I do is to use qemu or a real BMC, adjust the ipmi username/passwords, and then copy the ipmi_pass out.
>
> -- 
> Johnathan Mantey
> Senior Software Engineer
> *azad technology partners*
> Contributing to Technology Innovation since 1992
> Phone: (503) 712-6764
> Email: johnathanx.mantey@intel.com
>

