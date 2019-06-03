Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C91339D4
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 22:49:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HnH94WwHzDqNp
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 06:49:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derekh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HnFp17s3zDqL7
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 06:48:23 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53Kkgwc098161
 for <openbmc@lists.ozlabs.org>; Mon, 3 Jun 2019 16:48:20 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sw9m1k9ks-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 16:48:20 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <derekh@linux.vnet.ibm.com>;
 Mon, 3 Jun 2019 21:48:19 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 3 Jun 2019 21:48:17 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x53KmGDj18546712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 3 Jun 2019 20:48:16 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 081AC6E05E
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 20:48:16 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAEA86E04C
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 20:48:15 +0000 (GMT)
Received: from [9.10.99.138] (unknown [9.10.99.138])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 20:48:15 +0000 (GMT)
Subject: Re: [Design] PSU firmware update
To: openbmc@lists.ozlabs.org
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
From: Derek Howard <derekh@linux.vnet.ibm.com>
Date: Mon, 3 Jun 2019 15:48:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060320-0016-0000-0000-000009BD9E74
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011209; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01212795; UDB=6.00637379; IPR=6.00993856; 
 MB=3.00027169; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-03 20:48:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060320-0017-0000-0000-0000437A6442
Message-Id: <4a1d2e3c-b780-d72c-9af6-8c1d472873a9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906030140
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


On 6/3/2019 3:54 AM, Lei YU wrote:
> Hi All,
>
> This is a proposed design of PSU firmware update.
> It will be posted to gerrit for review after we have resolved comments
> in the mailing list.
>
> # PSU firmware update
>
> Author:
>     Lei YU <mine260309@gmail.com> <LeiYU>
> Primary assignee:
>     None
> Other contributors:
>     Su Xiao <suxiao@inspur.com>
>     Derek Howard <derekh@us.ibm.com>
> Created:
>     2019-06-03
>
>
> ## Problem Description
>
> There is no support in OpenBMC to update the firmware for PSUs.
>
>
> ## Background and References
>
> In OpenBMC, there is an existing interface for [software update][1].
>
> The update process consists of:
> 1. Uploading an image to BMC;
> 2. Processing the image to check the version and purpose of the image;
> 3. Verifying and activating the image.
>
> Currently, BMC and PNOR firmware update are supported:
> * [phosphor-bmc-code-mgmt][2] implements BMC code update, and it supports all
>    the above 3 processes.
> * [openpower-pnor-code-mgmt][3] implements PNOR code update, and it only
>    implements "verifying and activating" the image. It shares the function of
>    the above 1 & 2 processes.
>
> For PSU firmware code update, it is preferred to re-use the same function for
> the above 1 & 2.
>
>
> ## Requirements
>
> To mitigate the risk of power loss, the PSU firmware code update shall meet
> pre-conditions:
> 1. The host is powered off;
> 2. The redundant PSUs are all connected;
> 3. The AC input and DC standby output shall be OK on all the PSUs;

As part of the PSU code update, it will turn off it's control supply.  
If only 1 PSU has AC applied, and it turns off the control supply, then 
the BMC would lose power and get reset, which is not wanted.  That being 
said, some systems may have 4 PSU instead of 2.  So ALL of the redundant 
PSUs wouldn't be connected, but at least 1 other PSU should be connected 
and have AC applied, so that when 1 PSU is reset due to the download, at 
least 1 other PSU will hold up the control supply and be providing 
standby power to the BMC.  It should still be ok to download the 
remaining PSU even if they don't have AC applied.

So #2 and #3 aren't always valid, including in systems with more than 2 
PSUs attached.  It's probably better to say that whenever downloading a 
PSU, that at least 1 other PSU is connected and has AC attached.


> And during updating:
> 4. After the update is done on a PSU, the AC input and DC standby output shall
> be checked.
>
>
> ## Proposed Design
>
> The PSU firmware code update will re-use the current interfaces to upload,
> verify, and activate the image.
>
> 1. The "Version" interface needs to be extended:
>     * Add a new [VersionPurpose][4] for PSU;
>     * Re-use the existing ExtendedVersion as an additional string for
>       vendor-specific purpose, e.g. to indicate the PSU model.
> 2. Re-use the existing functions implemented by [phosphor-bmc-code-mgmt][2] for
> uploading and processing the image.
>     * The PSU update image shall be a tarball consists of a MANIFEST, images,
>       and signatures
> 3. There will be a new service that implements the [Activation][5] interface to
> update the PSU firmware.
>     * It shall run all the checks described in [Requirements] before performing
>       the code update;
>     * It shall run the checks after each PSU code update is done.
>     * The service will verify the signature of the image;
>     * The service shall check the ExtendedVersion to make sure the image matches
>       the PSU model.
>     * The service will call a configurable and vendor-specific tool to perform
>       the code update.
>     * When each check fails, or the vendor-specific tool returns errors, the PSU
>       code update will be aborted and an error event log shall be created.
>     * When the PSU code update is completed, an informational event log shall be
>       created.
>
>
> ## Alternatives Considered
>
> ### General implementation
>
> The PSU firmware update could be implemented by separated recipes that only
> call vendor-specific tools.
> It will be a bit simpler but loses the unified interface provided by OpenBMC's
> existing [software update interface][1], and thus it will become difficult to
> use a standard API to the PSU firmware update.
>
> ### VersionPurpose
> It is possible to re-use the VersionPurpose.Other to represent the PSU image's
> version purpose.
> But that requires additional information about the image, otherwise, there is
> no way to tell if the image is for PSU, or CPLD, or other peripherals.
> A new VersionPurpose.PSU is more specific and makes it easier to implement and
> friendly for the user.
>
> ### Additional string
> The design proposal uses ExtendedVersion as the additional string for
> vendor-specific purpose, e.g. to indicate the PSU model, so the implementation
> could check and compare if the image matches the PSU model.
> It is possible to make it optional or remove this additional string, then the
> implementation will not verify if the image matches the PSU. It could be OK if
> we trust the user who is uploading the correct image, especially the image
> shall be signed.
> But it is always risky in case the image does not match the PSU, and cause
> unintended damage if the incorrect PSU firmware is updated.
>
>
> ## Impacts
>
> This design only introduces a new VersionPurpose enum into the dbus interfaces.
> The newly introduced PSU firmware update service will be a new service that
> implements existing [Activation][5] interface.
> So the impacts are minimal.
>
>
> ## Testing
>
> It requires the manual tests to verify the PSU code update process.
> * Verify the PSU code update will not start in case the pre-conditions are not
>    met;
> * Verify the PSU code update is done on all PSUs successfully when the
>    pre-conditions are met.
> * Verify the PSU code update will fail in the case that any PSU's AC input or
>    DC standby output is lost during code update.
>
>
> [1]: https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Software
> [2]: https://github.com/openbmc/phosphor-bmc-code-mgmt/
> [3]: https://github.com/openbmc/openpower-pnor-code-mgmt/
> [4]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_project/Software/Version.interface.yaml#L14
> [5]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Activation.interface.yaml
>

