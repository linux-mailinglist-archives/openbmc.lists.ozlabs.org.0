Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAC016EEB8
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 20:11:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RpSm2gPmzDqD3
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 06:11:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iHN75zAW; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RpRH6H9vzDq6l
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 06:10:19 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id r16so590170otd.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fVLQyN4DBaV91DLtIW5u+yB6hhTMM6k6oTU/477CMSk=;
 b=iHN75zAWKENA10d4h8VFpr5VKOYKmAIsTGOSqchRuZzgy8L7o+i1tyxvhLBmytCAih
 83cHBGCHJ0yPaOZ2w/dGZMMRfZjb13ElxUHNqc5hFrIvtJhCTcInQS6vaLzySGrU7CkR
 YkycgDBcKZwysWAVlwE3VK35JhOJGqengTDj4U5yPzWU9t7ZEkFOXJZzE1doEcbuWvoJ
 aqs1d44VfheiLUOsMM/WeYT2qrwDD9N8zDZpJ6mmpVn7CG7nwvvd5WEQ4dOa0j20X6wQ
 Kp2bLc+0xu0xSpRoItIwjtL42AYE+GWDJ9udPGYavtHkCY/qzrFVUuhpmMXPVc7VidTL
 /jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fVLQyN4DBaV91DLtIW5u+yB6hhTMM6k6oTU/477CMSk=;
 b=MO2o+YIA7d9JW9Fjey0haFoD/C54a1GshaSHl9A7STpkr61NkJRjc6kAC7gdYJadZt
 JntDLzv7H5IZNo08rRpf5yBRxudh+wk/q8RZacvIB1Haf6mTEIbfyLyJIg1kD1FQ1RPa
 JJXysqmhgwUglUNKmdF6r4x3nHBFm4nQrCxhr0kiZ0oygLjS6lLdLSmoM/nKK1AxUHVn
 Ac7ATVwAK4zPBIclH80xktu+MITpxkOmS++qMbvQAQsBVPCg69/wGhd+cky1s6DpKluQ
 Km+lKhFcbA2PV/d56Ks9zwVKoPCtfTlJMkskghR/cmkVRreXav9vNQRD3WEtaydjeTRJ
 on5g==
X-Gm-Message-State: APjAAAWJTALzl9+oaWwrXuB5P6wT6aECQkfzjozAtOH7Z5+43GJgEeej
 E/m5DNQOwmzR9pBuC+fgMWsNCC/K77A=
X-Google-Smtp-Source: APXvYqwASsYaO1/vlZVRDJUCLjYg8R27ZBSMZM3H/+9oGN1R3FgjVfc0FD2uytXZn6+n1WIMhXuMhA==
X-Received: by 2002:a9d:61c5:: with SMTP id h5mr65036otk.85.1582657815001;
 Tue, 25 Feb 2020 11:10:15 -0800 (PST)
Received: from ?IPv6:2600:1700:19e0:3310:4d4b:8e96:a1a6:e51a?
 ([2600:1700:19e0:3310:4d4b:8e96:a1a6:e51a])
 by smtp.gmail.com with ESMTPSA id s12sm5525008oic.31.2020.02.25.11.10.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 11:10:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: System Firmware states on D-Bus
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20200225160412.GM67957@patrickw3-mbp.dhcp.thefacebook.com>
Date: Tue, 25 Feb 2020 13:10:14 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <E41FEB0F-FF3D-49CB-9416-76C2AC7B6EA4@gmail.com>
References: <9CA8B63A-991B-49C2-A8D1-83D1CCB6C46A@gmail.com>
 <4fd6c84c-8d57-b907-5aad-9057476a3be8@linux.intel.com>
 <20200225160412.GM67957@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 25, 2020, at 10:04 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Feb 25, 2020 at 07:47:42PM +0530, Thomaiyar, Richard Marian =
wrote:
>> Prefer D-Bus conveying details in finer / better manner, rather than =
tying
>> it towards any user facing application like Redfish / IPMI.
>=20
> I agree with this.
>=20
> Define internal D-Bus information with the most we have available and
> let external interfaces map this to their constrained subset as
> necessary.  There is no reason to limit our own abilities because of =
the
> management interface du-jour.

Yep, no arguments from me here. The PLDM sensor(or whatever
the right term for it is) will support all defined values sent to it
by the system firmware.

bmcweb will translate what it can when responding to a Redfish
API query for the host state.

I=E2=80=99m thinking I=E2=80=99ll have phosphor-state-manager translate =
whatever
it can into the OperatingSystemState and BootProgress D-Bus
properties.

>=20
> --=20
> Patrick Williams

