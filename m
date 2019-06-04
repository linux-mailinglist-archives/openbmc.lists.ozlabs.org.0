Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A467433F79
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 09:03:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J2tw1gMmzDqWK
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 17:03:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fuS7AVBh"; 
 dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J2tJ65PVzDqJk
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 17:02:32 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id x24so16488963ion.5
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0rz9YDExShGBfM78CsdY/0keNeBzgs7eQWWEExkDsA=;
 b=fuS7AVBhHh5+g1g8L08uOeVLFRMoDxvP6fEW2iJwgCmTe7Gq7oT3rJTuFO/o4nbS0C
 ls/+jsAskMBa99TyWvsWbNAKD2QZ2sxo2EpsEpsv2gSPH1VrX5NltXn3550PEEyXVGoR
 ZnH3Hg+gl715Rm1Sr+zZKjhKuPjIl9wCtmEQJg5FCjZXBDzp2vz8Iadm0YkhiS0ERWyt
 0miAVV1NXp0AaRRTsDR1X/nrAC1w4zBuba5ogtNnZm3gNgKUegUiooaLGidlsS5hKSXS
 udzWz7dvclXWzQQ38lc6uuLl4B/85BWZ6dK5l1MAGwHcz4CcuBrnlaAfwNxZ/+hiMdY+
 zIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0rz9YDExShGBfM78CsdY/0keNeBzgs7eQWWEExkDsA=;
 b=IwrqojjHg8MesKg0jK6w/Qd1jolU1gPij0OpfItv5w/NbYfmIV5Z1nr/8nLUr103U2
 YklA6kVfjg7O2eurVH8m7lOt937xpsCG2AlNf98xZUO6gNPVvSFbNThcpDks2/VqF5rL
 /6ZMy8ggFpoc8IRGjTgSKRnUwlPAheKiBksV4twXavYsWIw1BrtFpZTeojm6KuzDKPrt
 b6YPQHPglXz70nKANRBElsvTkBlAdROP6aIAQeCRihBECS85XQX2cBEz4g7QJ9mWRf9K
 wbdYofqFDYa5umV1gwuXdc7xA2GJvZNYzaEtF+gH4OF54Y+7Yad78kHAJzxJvoeiAnpk
 qSeQ==
X-Gm-Message-State: APjAAAVA8oqgkwuib/0xoTWk03c+lPBFjMH1zPTG0XqZjur2qfGsZUmr
 nUK6DNPn11UBw24ginafr/79s97JVmSIKkBn+pI=
X-Google-Smtp-Source: APXvYqxTVGrh5dE4cnLBD5oIFd1kMo/U4FS8OR5FGtG52L36D+0K3AUCWOfY+7TNwrbVvRIbZUiwAVJ6/TeIwyhifpA=
X-Received: by 2002:a5e:8f08:: with SMTP id c8mr3591707iok.52.1559631748994;
 Tue, 04 Jun 2019 00:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
 <BL0PR2101MB09326C07D2FFA072FB19CEC7C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB09326C07D2FFA072FB19CEC7C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 4 Jun 2019 15:02:17 +0800
Message-ID: <CAARXrtmyU41PvzuqM91f+N-YTaovy_MP4aDY=+W=P6Be2n=-EQ@mail.gmail.com>
Subject: Re: [Design] PSU firmware update
To: Neeraj Ladkani <neladk@microsoft.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 2:43 PM Neeraj Ladkani <neladk@microsoft.com> wrote:
>
> Are you proposing that if PSU FW is attempted and if system is powered on, the FW update will not start?

Yes, do not perform PSU FW update when the system is powered on, otherwise, it
is considered risky.

> We should not tie framework with these requirements.  If this is really required for a particular platform design then vendor specific tool can have right checks before triggering the update.

This is a good point, I would like to know if there are cases that the PSU
could be updated safely while the system is powered up.
If there are really such cases, then it's true the framework should not
require this, and leave it to vendor-specific tools.

> Also how do we tie this with IPMI?  How does the payload reach BMC and How do we know progress of FW update ?

This design does not involve IPMI at all. The payload is uploaded, processed,
and activated by the same interface as BMC code update.
See doc here: https://github.com/openbmc/docs/blob/master/code-update/code-update.md
So you could use REST APIs or Redfish to do the PSU code update.
