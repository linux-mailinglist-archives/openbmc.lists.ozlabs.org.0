Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D02113722
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 22:37:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SsdT1B8JzDqT5
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 08:37:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sscn5nNvzDqMC
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 08:36:55 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:36:51 -0800
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="213919389"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:36:51 -0800
Date: Wed, 4 Dec 2019 13:36:50 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: BMC update via TFTP
Message-ID: <20191204213650.GB9613@mauery.jf.intel.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: rgrs <rgrs@protonmail.com>, openbmc@lists.ozlabs.org,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04-Dec-2019 09:47 AM, Joseph Reynolds wrote:
>On 12/3/19 1:55 PM, Adriana Kobylak wrote:
>>On 2019-12-03 11:08, Gunnar Mills wrote:
>>>On 12/3/2019 10:12 AM, Gunnar Mills wrote:
>>>
>>>>>In BMC WebUI under "Download image file from TFTP server" section,
>>>>>
>>>>>we have text fields "TFTP Server IP address" and "File name".
>>>>>"File name" doesn't take folders in path. Is this a bug or
>>>>>expected behavior?
>>>>>
>>>>>TFTP downloads work only if file is kept in root of tftp share.
>>>>This is expected.
>>>>
>>>https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf8048=
7d71c3cdb7165d065079377/download_manager.cpp#L33
>>>
>>>>[1]
>>>
>>>As long as we continue to sanitize the local filename, I don't see why
>>>we need to limit the source file name.
>>>=A0Patrick, Adriana, Any objection? Remember why we wrote it this way? I
>>>assume for simplicity..?
>>
>>It was done for security to prevent users from specifying a file=20
>>outside the tftp directory, such as /mydir/../root/system-file.
>>But seems the current file name handling breaks the ability to get=20
>>files from a subdir like Raj pointed out, we should be able to fix=20
>>that out, tftp supports having a file in subdirs such as=20
>>/tftpboot/subdirectory/file, and passing /subdirectory/file to it as=20
>>the path.

While we are on the topic of security, should we do something about=20
unsecured protocols for image transfers? Adding an HMAC and key along=20
with the IP/path would then make sure the file that was fetched contains=20
the contents that were expected.

Even if the BMC only accepts signed images, we want to make sure that=20
the signed image the BMC fetches is the one that the administrator=20
*wants* to be fetched. With tftp or http (or any insecure transport),=20
one possible MiTM attack would be to substitute an alternate valid=20
image. Let's say the admin wants to go from 1.18 to 1.20, bu the=20
attacker wants to go to 1.16, which has a known vulnerability. The=20
image would be authenticated by the signature, and will be accepted.

With an added HMAC, the MiTM attack would be thwarted. The HMAC and key=20
would be transmitted to the BMC over a secure channel (https) so the=20
attacker would not be able create a suitable replacement for the image=20
in the insecure channel.

--Vernon

>It seems to me that the burden must be on the TFTP server to protect=20
>itself.=A0 See the "Security Considerations" section of RFC 1350 -=20
>https://tools.ietf.org/html/rfc1350
>Specifically, OpenBMC only needs read access (it does not need to=20
>write files to the TFTP server) and only needs to be able to access=20
>files the TFTP server intends to provide (typically: all the files=20
>under a specific directory).
>
>To be more clear:
>- OpenBMC does not provide a TFTP server, so this is guidance for=20
>someone setting a TFTP server for use with an OpenBMC system
>- The TFTP server only needs to offer READ access.
>- The TFTP server ought to prevent clients from using=20
>cleverly-constructed pathnames (for example, any file which begins=20
>with "/" or contains an ".." element) to access files outside of its=20
>sandbox.
>- That said, I am not a TFTP expert, and whichever TFTP server is=20
>used, its security guidance should be followed.
>
>What all of the above, I think it would be okay for OpenBMC to=20
>validate the pathname it sends to the TFTP server, but don't think it=20
>is necessary.
>
>Finally, I hope we can move away from TFTP and more toward a secure=20
>image distribution approach.
>Note that TFTP is disabled in OpenBMC by default.=A0 See=20
>https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt
>
>- Joseph
>
>>>
>>>=A0Thanks,
>>>=A0Gunnar
>>>
>>>
>>>Links:
>>>------
>>>[1]
>>>https://github.com/openbmc/phosphor-bmc-code-mgmt/blob/b0ce996ac60cf8048=
7d71c3cdb7165d065079377/download_manager.cpp#L33
>>>
>
