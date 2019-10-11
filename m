Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFBD37D5
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:24:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qCwc3Yg8zDqXX
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 14:24:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZgwD5ZMT"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qCw04F7hzDqMp
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 14:23:27 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id c6so18367909ioo.13
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Pex1pb3T1YCj4HLvq7gbJc9bFiX4OPomSokRA89N46o=;
 b=ZgwD5ZMTK+RQ7KTNzSi+0No4f0raus3ajtci2NUMVgKL78GTme2sFtXV2slyNxzrvx
 tiFj+uMio4J5j5viouMdtFPUX+tXeI/rfjf9yq52rHUMmsTiOSeZRcoHiaoauwZPG7fq
 sv9C0nryaH6XH/X2BDe+cL3uomJrTPF+6L6jqznS7hDgu6NYDefBA8uciN9QsIzjAPaG
 syaVjQWr8XxQcNRyhVpmuU643CrStyNjyKucTSfTuA0cgPspzBbP3BClATcsuX7mCm27
 ZJsHt+S6gH9HoxwRpazXkLJRetsOOted7wQNFpuxufqmoI/85vkzdtJ1WDKXiZyl6B5m
 3UDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Pex1pb3T1YCj4HLvq7gbJc9bFiX4OPomSokRA89N46o=;
 b=tQ212+qGilSy+AFkMr63wEMG7+T4sF+1rLHov2g4kfGJnGMeNTigH8Ozua2XtOsAvN
 7C9MVlOncs7c0sQSApx3oRBlAuTopAY4XK4YEl7mm3wmCzOCxH3CB7SGE9NM7WZnzak2
 llX+WbKmqUZh+rI9Uz94CrUf6HrhwWf8H0tYnZXAV5U6JDV0MEU1bMsP9s4L7BW2yIRK
 jCtERdkRRW5v3yCuyVQfPLR7GoL6Dj0DS81dWRGcYpfwmDzTd7gsqIFOcWTMdn2EtHdD
 SrfkY2+jv8Z1DKOXzUnfJlnww10xL6BNuqDlbiUWMuP1szoU4yCgJ9/2by9wi0z/6rKB
 V5Ag==
X-Gm-Message-State: APjAAAU+R42voeKjm/mCvqZlLOaKbmEe8j2Isq8Zd0gc6JOxnrdDbKEv
 NGNsPk1ULmvCdHIgHImtKlAoQ/Scp/dPptxeG1LgwQfBTOcqeQ==
X-Google-Smtp-Source: APXvYqySxiFvFJUdL6u0gewXn1Snt9ZhSlz/WnG7aWBiDD1T2oscMFQNFJNEpLhdnroc9NTQ0o2RFMAzFFWmMSaECuY=
X-Received: by 2002:a6b:7307:: with SMTP id e7mr5315424ioh.138.1570764203794; 
 Thu, 10 Oct 2019 20:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrtkkYGh5wGLYDEhHkG9B8QL-9ezW=n_a9R4-Wy-h4UWHig@mail.gmail.com>
In-Reply-To: <CAARXrtkkYGh5wGLYDEhHkG9B8QL-9ezW=n_a9R4-Wy-h4UWHig@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 11 Oct 2019 11:23:13 +0800
Message-ID: <CAARXrtnzxESqXCxqKpdrkbOPRz-t7gC0+mtYaQf3FWk_unbQ4A@mail.gmail.com>
Subject: Re: Getting DIMM size in Redfish
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, cheng.c.yang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
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

After sending this email, it's found that there is an existing review
to add DIMM properties:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/24976

@Cheng C Yang Could you kindly share where the properties are implemented?
Thanks a lot!

On Fri, Oct 11, 2019 at 11:01 AM Lei YU <mine260309@gmail.com> wrote:
>
> This mail is to discuss how to get DIMM size in Redfish (bmcweb).
>
> Currently, bmcweb does not report DIMM size because it's not
> implemented, and we are trying to implement this.
>
> The DIMM interface is defined in [phosphor-dbus-interface][1], which
> does not provide any metadata.
>
> For OpenPOWER systems, the size information is provided in `PrettyName`, e.g.
>
>     "PrettyName": "DDR4-2666 32GiB 64-bit ECC RDIMM"
>
> It is guaranteed to be a string with 5 parts, and we could parse this
> string to get the size.
> I do not know how other systems (e.g. x86 or ARM) get the DIMM size.
>
> During the [review][2] , Ed suggested creating an appropriate
> interface for the DIMM size.
>
> It's a good suggestion, but it could be complicated to be implemented:
> * The information is sent by host via inband IPMI as FRU;
> * In ipmid, the code to handle FRU is generic and part of the code is
> generated, so it could be hard to make a specific change for DIMM
> size.
>
> So the question to the community is, how other systems get the DIMM size?
> Knowing this, we could try to design a generic method to handle the case.
>
> Otherwise, we will have to write specific code, either in ipmid or in
> bmcweb, to get such specific values.
>
> Thanks!
>
> [1]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Item/Dimm.interface.yaml
> [2]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/25754
