Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D857D3EB7AF
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 17:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmS4L5Rhfz3bnf
	for <lists+openbmc@lfdr.de>; Sat, 14 Aug 2021 01:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J6BviG7V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J6BviG7V; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmS3x6lTrz3081
 for <openbmc@lists.ozlabs.org>; Sat, 14 Aug 2021 01:22:51 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id e1so5364861qvs.13
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ne4MsQS3dSk6INUZZJZ1SsN3/gDx6CLEghkOfe8ltvc=;
 b=J6BviG7VCKf0jAvNRPBvFkjJRDUVO3RCcLRETrkxX9tMOu1zFBqZdOgTkSeWlG5+4F
 zocPn6tmMSIAD0RX2jbtXbeKCo6GvesiFYTuiMzEhJNQV1lUWaqZtboiwt6/6TJytfZf
 4za7+kd193BPrTBOZLTytDE9f/BqK+F1nwys6kwQx9ePEfOm6z17z3pl8LMGZs1x1Iob
 5cSMt7bu+7S5sFh09dlBDLNEtfFSzQYKVBuglMqNfK3vPTa36EK4gz/PPKgBMODfte8H
 vHTWMqcIun+//CZMUVpRKcEUFh++EryBH+kRKpMNgtr/guKNYAlkV7tUYn6xq7BMfy5b
 4ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Ne4MsQS3dSk6INUZZJZ1SsN3/gDx6CLEghkOfe8ltvc=;
 b=izTKHYpak5FLe65ExC1bIOSsGL+Ks+/qE6BTxgJ46qGBIq6oL988w0ltqCX3UsVA9t
 dj/UB//0+gBuKhUtQe+nu7ZxrgATxMqEDwvVIE+VODN3zMatds50UsGCgXpb6a6jKCAF
 Su1iSGqPWUEd2EN+21Nz1Wg2UrcIIQcPfLPSp8tnYIbMR4/LsoQE9+tG3z85Woz+NZlZ
 hHyN8Muio7VGMGC/fHLRk3urzXW8/KlWv72cGAkVd0tm8Gm60rE4y/u3aH/R8a5bsxj+
 6gOs8dBgfVB/bmIgEkB7y08LaTo3gTuFSQURilvNucSRT28GOPOrbzlX2pL8AhIjIH8Z
 mASA==
X-Gm-Message-State: AOAM5337c3odRHVCZ5Xg7a1ddWk7HsodASaiAUPnpl0V2r4i8r/zktTQ
 uxqDjLzIF8cyFYPPni5v1Ks=
X-Google-Smtp-Source: ABdhPJxW86QwVZAFopIK7UYyeayPq9Y10F/whLb/1z68bV5w8mcn3XFdqjCc+0OU7jKBqUUN5JvkHQ==
X-Received: by 2002:a05:6214:965:: with SMTP id
 do5mr3154863qvb.0.1628868166857; 
 Fri, 13 Aug 2021 08:22:46 -0700 (PDT)
Received: from smtpclient.apple (host-23-251-84-108.VALOLT4.epbfi.com.
 [23.251.84.108])
 by smtp.gmail.com with ESMTPSA id f24sm960116qtp.1.2021.08.13.08.22.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Aug 2021 08:22:46 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: Looking for qemu tree for 'qemu-system-arm' jenkins build
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CA+H48BQTCfxfZ4M-Ph5Zy-=RBfNgnXb8xDcT0HSaDbgjRe07tg@mail.gmail.com>
Date: Fri, 13 Aug 2021 11:22:45 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <B277C6A5-83CF-4FE7-80C7-6C2C0A29BA17@gmail.com>
References: <CA+H48BQTCfxfZ4M-Ph5Zy-=RBfNgnXb8xDcT0HSaDbgjRe07tg@mail.gmail.com>
To: sharad yadav <sharad.openbmc@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Aug 13, 2021, at 8:25 AM, sharad yadav <sharad.openbmc@gmail.com> =
wrote:
>=20
> Hi All,
>=20
> I am looking for the qemu tree from where =
https://jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artifa=
ct/qemu/build/qemu-system-arm is being built.
> It will be a great help if someone can point me to the qemu repo and =
branch being used for jenkins build.

That job uses https://github.com/openbmc/qemu/=20

>=20
> Thanks,
> Sharad

