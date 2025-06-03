Return-Path: <openbmc+bounces-118-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77242ACC621
	for <lists+openbmc@lfdr.de>; Tue,  3 Jun 2025 14:05:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBTtN6brgz2yKq;
	Tue,  3 Jun 2025 22:05:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.149.242.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748952316;
	cv=none; b=iRsmfLNio0H0dsVL4TCA5Ap9nUOW5+ZxkuV9fKmmW8clm2dFZD5BLBHF2ZJVoHl17wU1YwA7KGApOWorWtpMCpuv/CP4hGUhFSAADRhPC4/W+vsc7pgCwu562difY66GeuAPH5kR1wqolOEhXvYoI7xILn9nTfFYCfEBaVpHK+G5VHyplc02xfYbMrNXk7M5/+M+eqTTOYa0PSdsdMjz9Qo8s/XyZ46pICu2MvWbpsEUfU1K1on0rCxL6Ux+bDaRVDxUyo1hMAKkmlALfU6tpYTWiXo7geWpZG/SJdlfQKfBibUePplg/sIAE05mvGut9SEW/Gn9niRlh9O2+TeUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748952316; c=relaxed/relaxed;
	bh=lyZt/ntjuTBlNl3hO5wgG+9zz1R8cNDlK1LMN9EpDrE=;
	h=Cc:Subject:From:Mime-Version:In-Reply-To:Date:Message-Id:To:
	 References:Content-Type; b=kmr9eJTDgBJum2QGYjsq2OC3fIWXcpaehUsb0aae0u6xDA7Ui062IUkzt4wVGO1nREDX52u0ApwBIo04FL76ejxDi/14gen+GDKaAE3GJEy5LU5PqsnJMMN9Egu91xl6BncxieD4SxnQs7gN8hj9ednNFJBoqZ0F4loF0GVo8j45L2A7yQzqUGZRJ71su9QQbzmjqQyKLZI06pZGZMx7QHvkmwSKhkGo4iMUswdLEdzbzvVASJRLxQOcjGaaJQBjx5T3GzgUP77wj980S02LNLWYXJkE89j4Hx1viLnBrgD0cYh+rUWqU/CDFfL2zC935YHZwTu1gKXuKcwqYPRyzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=oIH8pCcy; dkim-atps=neutral; spf=pass (client-ip=103.149.242.130; helo=lf-1-130.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=oIH8pCcy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=103.149.242.130; helo=lf-1-130.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 919 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 22:05:14 AEST
Received: from lf-1-130.ptr.blmpb.com (lf-1-130.ptr.blmpb.com [103.149.242.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBTtL36v3z2xl6
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jun 2025 22:05:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1748951135; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lyZt/ntjuTBlNl3hO5wgG+9zz1R8cNDlK1LMN9EpDrE=;
 b=oIH8pCcyMDw+OtSw9HrqMLjqmY/7NOg/xIO5R0+qtuT0ehnONXUujYeEd4+9P5HU7fXMKO
 gSIwNavd5EANhTXr7LbFdjWiwDLkRg1FTWXuoLLZPk5F/y4Y+TFIYCoJW28lG0HvdbYpIZ
 W06EGgnWDjdQXyqUa8CuoICWNu42GT82FHRvhuX42JZMEuLZng8KdwbKsqD069NHmTvFHi
 oIhSkhW9tSAmk0U8vAok7teocAeyM5N4xxOANZ06hGzgViUaLUsq6jKU6x/dXGPrwXVZiQ
 irVxYsihf/YpuppN7duM4ny40oZeaKX1JuQ+3Gbhb5/zzwdfEardUuS86W5Cwg==
X-Lms-Return-Path: <lba+1683ee05e+6418af+lists.ozlabs.org+zhangjian.3032@bytedance.com>
Cc: <openbmc@lists.ozlabs.org>
Subject: Re: [External] how to wipe /var /etc during upgrading
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <CA+3C=r9siAo_CvcZDThLczrY09zFaiPK2O79hF++scA81vGHZw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Jun 2025 19:45:33 +0800
Message-Id: <51dd8bf76aa056fbc966e48132cac2607d2326ca.7435492b.35e1.4bc3.89f7.870abe7dd2f2@bytedance.com>
To: "Yang Zhang" <yang.zhang.wz@gmail.com>
References: <CA+3C=r9siAo_CvcZDThLczrY09zFaiPK2O79hF++scA81vGHZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Yang;

The simplest way is to execute:
~# > /run/initramfs/whitelist && reboot,

For the main logic, please refer to the vars `do_save` and `whitelist`

https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e50=
5e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh#L320
https://github.com/openbmc/openbmc/blob/1da9f898e1ec4d24d2e9229c56dd2495e50=
5e485/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-update.sh#L18=
3C1-L184C1

Jian.
> From: "Yang Zhang"<yang.zhang.wz@gmail.com>
> Date:=C2=A0 Tue, Jun 3, 2025, 19:22
> Subject:=C2=A0 [External] how to wipe /var /etc during upgrading
> To: <openbmc@lists.ozlabs.org>
> Hi all
>=C2=A0
>=C2=A0
> I used scp image-bmc to /run/initramfs to upgrade the BMC, but found that=
 the configurations under /etc still exist after the upgrade. How can I upg=
rade /etc together during the process?
>=C2=A0
> --=C2=A0
> best regards
> yang

